"""
完整实验 - 运行所有Acidwave任务
=======================================

参考WebArena的评估流程，运行全部16个任务并生成详细报告。

用法:
    python experiments/run_full_experiments.py
    python experiments/run_full_experiments.py --difficulty easy
    python experiments/run_full_experiments.py --task-range 0 5
"""

import os
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# CRITICAL: Patch AgentLab to support Acidwave tasks in Ray workers
import patch_agentlab

from benchmark.acidwave import AcidwaveBenchmark

# Set API key if not already set
if not os.getenv("OPENAI_API_KEY"):
    print("❌ 错误: OPENAI_API_KEY 未设置")
    print("请设置环境变量或创建 .env 文件")
    sys.exit(1)

from agentlab.experiments.study import make_study
from agentlab.experiments.loop import EnvArgs
from agents.acidwave_agent import ACIDWAVE_AGENT, ACIDWAVE_REASONING_AGENT


def run_full_experiments(
    task_ids=None,
    difficulty=None,
    agent=None,
    headless=True,
    slow_mo=100,
    max_steps=30,
    n_jobs=1,
    quiet=False,
):
    """
    运行完整的Acidwave实验
    
    Args:
        task_ids: 要运行的任务ID列表 (None = 全部)
        difficulty: 按难度筛选 ("easy", "medium", "hard")
        agent: 使用的Agent (默认: ACIDWAVE_AGENT)
        headless: 是否无头模式运行
        slow_mo: 浏览器操作延迟 (ms)
        max_steps: 每个任务最大步数
        n_jobs: 并行任务数
        quiet: 静默模式，减少终端输出
    """
    def log(msg="", level="info"):
        """条件打印函数"""
        if quiet and level == "info":
            return
        print(msg)
    
    log("\n" + "="*80)
    log("ACIDWAVE 完整实验 - WebArena风格评估")
    log("="*80)
    
    # Select agent
    if agent is None:
        agent = ACIDWAVE_AGENT
    
    log(f"\n🤖 Agent配置:")
    log(f"   名称: {agent.agent_name}")
    log(f"   模型: {agent.chat_model_args.model_name}")
    log(f"   温度: {agent.chat_model_args.temperature}")
    
    # Load benchmark
    log("\n[1/6] 加载任务...")
    
    # Determine task subset
    if task_ids is not None:
        # Explicit task IDs
        benchmark = AcidwaveBenchmark(task_subset=task_ids)
        log(f"   使用指定任务: {task_ids}")
    elif difficulty is not None:
        # Filter by difficulty
        temp_benchmark = AcidwaveBenchmark()
        filtered_tasks = temp_benchmark.get_tasks_by_difficulty(difficulty)
        task_ids = [t["task_id"] for t in filtered_tasks]
        benchmark = AcidwaveBenchmark(task_subset=task_ids)
        log(f"   按难度筛选: {difficulty}")
        log(f"   匹配任务: {len(task_ids)}个")
    else:
        # All tasks
        benchmark = AcidwaveBenchmark()
        log(f"   加载所有任务: {len(benchmark)}个")
    
    # Show task details
    if not quiet:
        log(f"\n   任务详情:")
        for i, task in enumerate(benchmark):
            log(f"      [{task['task_id']}] ({task['difficulty']:6s}) {task['intent'][:50]}...")
    
    # Configure browser settings
    log(f"\n🖥️  浏览器配置:")
    log(f"   显示模式: {'无头' if headless else '可视化'}")
    log(f"   操作延迟: {slow_mo}ms")
    log(f"   最大步数: {max_steps}")
    log(f"   并行任务: {n_jobs}")
    
    # Create study
    log("\n[2/6] 创建实验...")
    
    try:
        # Create custom EnvArgs with settings
        custom_env_args_list = []
        for env_arg in benchmark.env_args_list:
            custom_env_arg = EnvArgs(
                task_name=env_arg.task_name,
                task_seed=env_arg.task_seed,
                task_kwargs=env_arg.task_kwargs,
                max_steps=max_steps,
                headless=headless,
                slow_mo=slow_mo,
                viewport={"width": 1280, "height": 720},
                record_video=False,
            )
            custom_env_args_list.append(custom_env_arg)
        
        benchmark.env_args_list = custom_env_args_list
        
        # Create study
        suffix = f"full_experiment"
        if difficulty:
            suffix += f"_{difficulty}"
        if task_ids and len(task_ids) < 16:
            suffix += f"_tasks{len(task_ids)}"
        
        study = make_study(
            agent_args=[agent],
            benchmark=benchmark,
            suffix=suffix,
            comment=f"完整评估: {len(benchmark)}个任务",
        )
        log(f"   实验名称: {study.name}")
        log(f"   实验目录: {study.dir}")
        
    except Exception as e:
        print(f"   ❌ 无法创建实验: {e}")  # Always show errors
        import traceback
        traceback.print_exc()
        sys.exit(1)
    
    # Check Acidwave is running
    log("\n[3/6] 检查Acidwave环境...")
    import requests
    try:
        response = requests.get("http://localhost:5173", timeout=3)
        if response.status_code == 200:
            log("   ✅ Acidwave前端运行正常")
        else:
            log(f"   ⚠️  前端返回状态 {response.status_code}")
    except requests.exceptions.RequestException:
        print("   ❌ 无法连接到Acidwave!")  # Always show errors
        print("   请先启动: docker-compose up -d")
        response = input("\n   是否继续? (y/n): ")
        if response.lower() != 'y':
            sys.exit(1)
    
    # Run experiments
    log("\n[4/6] 运行实验...")
    log(f"   这可能需要 {len(benchmark) * 2}-{len(benchmark) * 5} 分钟...")
    
    if not headless and not quiet:
        log("\n   💡 浏览器窗口会打开,你可以观看agent的操作")
    
    try:
        study.run(n_jobs=n_jobs)
        log("   ✅ 实验完成!")
    except Exception as e:
        print(f"   ❌ 实验失败: {e}")  # Always show errors
        print(f"\n   查看日志: {study.dir}")
        sys.exit(1)
    
    # Analyze results
    log("\n[5/6] 分析结果...")
    from agentlab.analyze import inspect_results
    
    summary_file = None  # Initialize to avoid UnboundLocalError
    
    try:
        result_df = inspect_results.load_result_df(study.dir)

        # Enrich with difficulty if missing
        if "difficulty" not in result_df.columns:
            difficulty_map = {
                f"acidwave.task_{t['task_id']}": t.get("difficulty", "unknown")
                for t in benchmark
            }

            # Try to find a task identifier column
            task_col = None
            for candidate in ["task_name", "env_name", "task", "env_id"]:
                if candidate in result_df.columns:
                    task_col = candidate
                    break

            if task_col:
                result_df["difficulty"] = result_df[task_col].map(
                    lambda tn: difficulty_map.get(tn, "unknown")
                )
            else:
                # Fallback: fill with unknown to avoid KeyError in downstream analysis
                result_df["difficulty"] = "unknown"
        
        log("\n" + "="*80)
        log("实验结果")
        log("="*80)
        
        # Overall metrics
        total = len(result_df)
        success_count = (result_df["cum_reward"] > 0.8).sum()
        partial_count = ((result_df["cum_reward"] > 0.3) & 
                        (result_df["cum_reward"] <= 0.8)).sum()
        fail_count = (result_df["cum_reward"] <= 0.3).sum()
        
        success_rate = (success_count / total * 100) if total > 0 else 0
        
        # Always show key results
        print(f"\n📊 总体表现:")
        print(f"   成功: {success_count:2d} / {total} ({success_rate:5.1f}%)")
        print(f"   部分: {partial_count:2d} / {total}")
        print(f"   失败: {fail_count:2d} / {total}")
        
        # By difficulty
        if not quiet and ("difficulty" in result_df.columns or len(benchmark._tasks) > 0):
            print(f"\n📈 按难度分析:")
            
            # Add difficulty to results - check for task_name column
            if 'task_name' in result_df.columns:
                task_difficulty = {
                    f"acidwave.task_{t['task_id']}": t['difficulty']
                    for t in benchmark._tasks
                }
                result_df['difficulty'] = result_df['task_name'].map(task_difficulty)
            elif 'exp_args.env_args.task_name' in result_df.columns:
                # Alternative column name
                task_difficulty = {
                    f"acidwave.task_{t['task_id']}": t['difficulty']
                    for t in benchmark._tasks
                }
                result_df['difficulty'] = result_df['exp_args.env_args.task_name'].map(task_difficulty)
            
            for diff in ["easy", "medium", "hard"]:
                diff_tasks = result_df[result_df['difficulty'] == diff]
                if len(diff_tasks) > 0:
                    diff_success = (diff_tasks["cum_reward"] > 0.8).sum()
                    diff_total = len(diff_tasks)
                    diff_rate = (diff_success / diff_total * 100) if diff_total > 0 else 0
                    print(f"   {diff:6s}: {diff_success:2d}/{diff_total:2d} ({diff_rate:5.1f}%)")
        
        # Per-task details
        if not quiet:
            print(f"\n📝 任务详情:")
            
            # Find the task name column
            task_col = None
            for col in ['task_name', 'exp_args.env_args.task_name']:
                if col in result_df.columns:
                    task_col = col
                    break
            
            for _, row in result_df.iterrows():
                if task_col:
                    task_name = row.get(task_col, "Unknown")
                else:
                    task_name = "Unknown"
                    
                task_id = task_name.split("_")[-1] if "_" in task_name else "?"
                reward = row.get("cum_reward", 0)
                steps = row.get("n_steps", 0)
                error = row.get("err_msg", "")
                
                # Status icon
                if reward > 0.8:
                    status = "✅"
                elif reward > 0.3:
                    status = "🔶"
                else:
                    status = "❌"
                
                # Get task difficulty
                diff = row.get("difficulty", "?")
                
                print(f"   {status} 任务 {task_id} ({diff:6s}): 得分={reward:.2f}, 步数={steps}")
                if error and reward <= 0.8:
                    print(f"      错误: {error[:70]}")
        
        # Save summary
        log("\n[6/6] 保存报告...")
        
        # Summary file
        summary_file = study.dir / "experiment_summary.txt"
        with open(summary_file, 'w', encoding='utf-8') as f:
            f.write("="*80 + "\n")
            f.write("ACIDWAVE 实验总结\n")
            f.write("="*80 + "\n\n")
            f.write(f"Agent: {agent.agent_name}\n")
            f.write(f"Model: {agent.chat_model_args.model_name}\n")
            f.write(f"Tasks: {total}\n\n")
            f.write(f"成功率: {success_rate:.1f}% ({success_count}/{total})\n")
            f.write(f"部分完成: {partial_count}/{total}\n")
            f.write(f"失败: {fail_count}/{total}\n\n")
            f.write("="*80 + "\n")
            f.write("详细结果\n")
            f.write("="*80 + "\n\n")
            f.write(result_df.to_string())
        
        log(f"   ✅ 总结已保存: {summary_file}")
        
        # CSV export
        csv_file = study.dir / "results.csv"
        result_df.to_csv(csv_file, index=False)
        log(f"   ✅ CSV已导出: {csv_file}")
        
    except Exception as e:
        print(f"   ⚠️  无法分析结果: {e}")  # Always show errors
        import traceback
        traceback.print_exc()
    
    # Final summary
    log("\n" + "="*80)
    log("实验完成!")
    log("="*80)
    print(f"\n📁 结果目录: {study.dir}")  # Always show final results
    
    if not quiet:
        log("\n📊 下一步:")
        if summary_file:
            log("   1. 查看详细报告:")
            log(f"      cat {summary_file}")
        log("   2. 查看失败任务的截图:")
        log(f"      cd {study.dir}")
        log("      ls */screenshot_*.png")
        log("   3. 使用AgentXray可视化:")
        log("      agentlab-xray")
        log("\n💡 优化建议:")
        try:
            # Try to get success_rate from earlier
            if 'success_rate' in locals():
                if success_rate < 50:
                    log("   - 成功率较低,考虑:")
                    log("     • 改进agent提示词")
                    log("     • 增加max_steps")
                    log("     • 使用ACIDWAVE_REASONING_AGENT")
                elif success_rate < 80:
                    log("   - 成功率中等,考虑:")
                    log("     • 调整temperature参数")
                    log("     • 改进验证逻辑")
                else:
                    log("   - 成功率很好! 可以:")
                    log("     • 尝试更难的任务")
                    log("     • 优化步数效率")
        except:
            pass


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description="运行完整的Acidwave实验 (WebArena风格)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  # 运行所有任务
  python experiments/run_full_experiments.py
  
  # 只运行简单任务
  python experiments/run_full_experiments.py --difficulty easy
  
  # 运行指定任务范围
  python experiments/run_full_experiments.py --task-range 0 5
  
  # 使用推理agent
  python experiments/run_full_experiments.py --agent reasoning
  
  # 可视化模式 (显示浏览器)
  python experiments/run_full_experiments.py --no-headless --slow-mo 1000
  
  # 并行运行 (需要足够的资源)
  python experiments/run_full_experiments.py --n-jobs 3
        """
    )
    
    parser.add_argument(
        '--difficulty',
        choices=['easy', 'medium', 'hard'],
        help='按难度筛选任务'
    )
    
    parser.add_argument(
        '--task-range',
        nargs=2,
        type=int,
        metavar=('START', 'END'),
        help='运行任务ID范围 (例如: 0 5 表示任务0-4)'
    )
    
    parser.add_argument(
        '--task-ids',
        nargs='+',
        type=int,
        help='指定任务ID列表 (例如: 0 2 5 7)'
    )
    
    parser.add_argument(
        '--agent',
        choices=['standard', 'reasoning', 'fast'],
        default='standard',
        help='选择agent类型 (默认: standard)'
    )
    
    parser.add_argument(
        '--no-headless',
        action='store_true',
        help='显示浏览器窗口'
    )
    
    parser.add_argument(
        '--slow-mo',
        type=int,
        default=100,
        help='浏览器操作延迟 (ms, 默认: 100)'
    )
    
    parser.add_argument(
        '--max-steps',
        type=int,
        default=30,
        help='每个任务最大步数 (默认: 30)'
    )
    
    parser.add_argument(
        '--n-jobs',
        type=int,
        default=1,
        help='并行运行的任务数 (默认: 1, 顺序执行)'
    )
    
    parser.add_argument(
        '--quiet',
        action='store_true',
        help='静默模式，减少终端输出'
    )
    
    args = parser.parse_args()
    
    # Determine task IDs
    task_ids = None
    if args.task_ids:
        task_ids = args.task_ids
    elif args.task_range:
        start, end = args.task_range
        task_ids = list(range(start, end))
    
    # Select agent
    from agents.acidwave_agent import ACIDWAVE_FAST_AGENT
    agent_map = {
        'standard': ACIDWAVE_AGENT,
        'reasoning': ACIDWAVE_REASONING_AGENT,
        'fast': ACIDWAVE_FAST_AGENT,
    }
    agent = agent_map[args.agent]
    
    # Run experiments
    run_full_experiments(
        task_ids=task_ids,
        difficulty=args.difficulty,
        agent=agent,
        headless=not args.no_headless,
        slow_mo=args.slow_mo,
        max_steps=args.max_steps,
        n_jobs=args.n_jobs,
        quiet=args.quiet,
    )


if __name__ == "__main__":
    main()
