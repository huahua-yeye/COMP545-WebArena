"""
Result Analysis Tool - WebArena Style Report
=============================================

Analyze experiment results and generate detailed performance reports, including:
- Success rates grouped by difficulty
- Failed task analysis
- Step statistics
- Visualization charts

Usage:
    python experiments/analyze_results.py <result_dir>
    python experiments/analyze_results.py results/2025-12-13_18-00-00_*
"""

import sys
import json
from pathlib import Path
import pandas as pd
from typing import Dict, List, Optional
import argparse

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))


def load_experiment_results(result_dir: Path) -> Optional[pd.DataFrame]:
    """
    Load experiment results
    
    Args:
        result_dir: Path to results directory
        
    Returns:
        DataFrame with results or None if not found
    """
    try:
        from agentlab.analyze import inspect_results
        df = inspect_results.load_result_df(result_dir)
        return df
    except Exception as e:
        print(f"[X] Failed to load results: {e}")
        return None


def load_task_metadata(task_ids: List[int]) -> Dict:
    """
    Load task metadata
    
    Args:
        task_ids: List of task IDs
        
    Returns:
        Dict mapping task_id to task config
    """
    from benchmark.acidwave import AcidwaveBenchmark
    
    benchmark = AcidwaveBenchmark()
    task_map = {}
    
    for task in benchmark._tasks:
        task_map[task["task_id"]] = task
    
    return task_map


def extract_task_id(task_name: str) -> int:
    """Extract task_id from task_name"""
    try:
        # Format: acidwave.task_<ID>
        return int(task_name.split("_")[-1])
    except:
        return -1


def analyze_by_difficulty(df: pd.DataFrame, task_map: Dict) -> pd.DataFrame:
    """Analyze results grouped by difficulty"""
    
    # Extract task names from index
    if isinstance(df.index, pd.MultiIndex):
        task_names = df.index.get_level_values(0)
    else:
        task_names = df.index
    
    # Add task metadata
    df = df.copy()
    df['task_name'] = task_names
    df['task_id'] = df['task_name'].apply(extract_task_id)
    df['difficulty'] = df['task_id'].apply(
        lambda tid: task_map.get(tid, {}).get('difficulty', 'unknown')
    )
    df['intent'] = df['task_id'].apply(
        lambda tid: task_map.get(tid, {}).get('intent', 'Unknown')
    )
    
    # Calculate success (reward > 0.8)
    df['success'] = df['cum_reward'] > 0.8
    
    # Group by difficulty
    difficulty_stats = []
    
    for diff in ['easy', 'medium', 'hard']:
        diff_tasks = df[df['difficulty'] == diff]
        if len(diff_tasks) == 0:
            continue
        
        stats = {
            'difficulty': diff,
            'total': len(diff_tasks),
            'success': diff_tasks['success'].sum(),
            'success_rate': diff_tasks['success'].mean() * 100,
            'avg_reward': diff_tasks['cum_reward'].mean(),
            'avg_steps': diff_tasks['n_steps'].mean(),
        }
        difficulty_stats.append(stats)
    
    return pd.DataFrame(difficulty_stats)


def analyze_failures(df: pd.DataFrame, task_map: Dict) -> List[Dict]:
    """Analyze failed tasks"""
    
    # Extract task names from index
    if isinstance(df.index, pd.MultiIndex):
        task_names = df.index.get_level_values(0)
    else:
        task_names = df.index
    
    # Add metadata
    df = df.copy()
    df['task_name'] = task_names
    df['task_id'] = df['task_name'].apply(extract_task_id)
    df['difficulty'] = df['task_id'].apply(
        lambda tid: task_map.get(tid, {}).get('difficulty', 'unknown')
    )
    df['intent'] = df['task_id'].apply(
        lambda tid: task_map.get(tid, {}).get('intent', 'Unknown')
    )
    
    # Find failures (reward <= 0.8)
    failures = df[df['cum_reward'] <= 0.8].copy()
    
    failure_list = []
    for _, row in failures.iterrows():
        failure_list.append({
            'task_id': row['task_id'],
            'task_name': row['task_name'],
            'difficulty': row['difficulty'],
            'intent': row['intent'],
            'reward': row['cum_reward'],
            'steps': row['n_steps'],
            'error': row.get('err_msg', 'No error message'),
        })
    
    return failure_list


def analyze_step_efficiency(df: pd.DataFrame, task_map: Dict) -> pd.DataFrame:
    """Analyze step efficiency"""
    
    # Extract task names from index
    if isinstance(df.index, pd.MultiIndex):
        task_names = df.index.get_level_values(0)
    else:
        task_names = df.index
    
    df = df.copy()
    df['task_name'] = task_names
    df['task_id'] = df['task_name'].apply(extract_task_id)
    df['difficulty'] = df['task_id'].apply(
        lambda tid: task_map.get(tid, {}).get('difficulty', 'unknown')
    )
    df['success'] = df['cum_reward'] > 0.8
    
    # Only analyze successful tasks
    success_df = df[df['success']].copy()
    
    if len(success_df) == 0:
        return pd.DataFrame()
    
    # Group by difficulty
    step_stats = []
    for diff in ['easy', 'medium', 'hard']:
        diff_tasks = success_df[success_df['difficulty'] == diff]
        if len(diff_tasks) == 0:
            continue
        
        stats = {
            'difficulty': diff,
            'avg_steps': diff_tasks['n_steps'].mean(),
            'min_steps': diff_tasks['n_steps'].min(),
            'max_steps': diff_tasks['n_steps'].max(),
            'std_steps': diff_tasks['n_steps'].std(),
        }
        step_stats.append(stats)
    
    return pd.DataFrame(step_stats)


def generate_report(result_dir: Path, output_file: Optional[Path] = None):
    """
    Generate complete analysis report
    
    Args:
        result_dir: Results directory
        output_file: Output file path (None = print to console)
    """
    
    print("\n" + "="*80)
    print("ACIDWAVE EXPERIMENT RESULTS ANALYSIS")
    print("="*80)
    print(f"\n[*] Results Directory: {result_dir}")
    
    # Load results
    print("\n[1/5] Loading experiment data...")
    df = load_experiment_results(result_dir)
    
    if df is None:
        print("[X] Failed to load results")
        return
    
    print(f"   [OK] Loaded results for {len(df)} tasks")
    
    # Load task metadata
    print("\n[2/5] Loading task metadata...")
    
    # Extract task names from index (AgentLab uses tuple index: (task_name, agent_name, benchmark_name))
    if isinstance(df.index, pd.MultiIndex):
        task_names = df.index.get_level_values(0).tolist()
    else:
        task_names = df.index.tolist()
    
    task_ids = [extract_task_id(str(name)) for name in task_names]
    task_map = load_task_metadata(task_ids)
    print(f"   [OK] Loaded metadata for {len(task_map)} tasks")
    
    # Overall statistics
    print("\n[3/5] Computing overall statistics...")
    total = len(df)
    success_count = (df['cum_reward'] > 0.8).sum()
    partial_count = ((df['cum_reward'] > 0.3) & (df['cum_reward'] <= 0.8)).sum()
    fail_count = (df['cum_reward'] <= 0.3).sum()
    success_rate = (success_count / total * 100) if total > 0 else 0
    
    avg_reward = df['cum_reward'].mean()
    avg_steps = df['n_steps'].mean()
    
    # Difficulty analysis
    print("\n[4/5] Analyzing by difficulty...")
    difficulty_df = analyze_by_difficulty(df, task_map)
    
    # Failure analysis
    print("\n[5/5] Analyzing failed tasks...")
    failures = analyze_failures(df, task_map)
    
    # Step efficiency
    step_efficiency_df = analyze_step_efficiency(df, task_map)
    
    # ==========================================
    # Generate Report
    # ==========================================
    
    report_lines = []
    
    def add_line(text=""):
        report_lines.append(text)
        print(text)
    
    add_line("\n" + "="*80)
    add_line("DETAILED EXPERIMENT RESULTS REPORT")
    add_line("="*80)
    add_line(f"\n[*] Overall Performance")
    add_line("-" * 80)
    add_line(f"Total Tasks:       {total}")
    add_line(f"Successful:        {success_count:2d} ({success_rate:5.1f}%)")
    add_line(f"Partial Success:   {partial_count:2d}")
    add_line(f"Failed:            {fail_count:2d}")
    add_line(f"Average Score:     {avg_reward:.3f}")
    add_line(f"Average Steps:     {avg_steps:.1f}")
    
    # Difficulty breakdown
    add_line(f"\n[*] Breakdown by Difficulty")
    add_line("-" * 80)
    add_line(f"{'Difficulty':<12} {'Total':<8} {'Success':<8} {'Rate':<12} {'Avg Score':<12} {'Avg Steps':<12}")
    add_line("-" * 80)
    
    for _, row in difficulty_df.iterrows():
        add_line(
            f"{row['difficulty']:<12} "
            f"{row['total']:<8.0f} "
            f"{row['success']:<8.0f} "
            f"{row['success_rate']:<11.1f}% "
            f"{row['avg_reward']:<12.3f} "
            f"{row['avg_steps']:<12.1f}"
        )
    
    # Step efficiency for successful tasks
    if len(step_efficiency_df) > 0:
        add_line(f"\n[*] Step Efficiency (Successful Tasks Only)")
        add_line("-" * 80)
        add_line(f"{'Difficulty':<12} {'Average':<10} {'Min':<10} {'Max':<10} {'Std Dev':<10}")
        add_line("-" * 80)
        
        for _, row in step_efficiency_df.iterrows():
            add_line(
                f"{row['difficulty']:<12} "
                f"{row['avg_steps']:<10.1f} "
                f"{row['min_steps']:<10.0f} "
                f"{row['max_steps']:<10.0f} "
                f"{row['std_steps']:<10.2f}"
            )
    
    # Failed tasks
    if failures:
        add_line(f"\n[X] Failed Tasks Details ({len(failures)} tasks)")
        add_line("-" * 80)
        
        for i, failure in enumerate(failures, 1):
            add_line(f"\n{i}. Task {failure['task_id']} ({failure['difficulty']})")
            add_line(f"   Goal: {failure['intent'][:70]}")
            add_line(f"   Score: {failure['reward']:.3f}")
            add_line(f"   Steps: {failure['steps']}")
            if failure['error'] and failure['error'] != 'No error message':
                add_line(f"   Error: {failure['error'][:100]}")
    
    # Recommendations
    add_line(f"\n[!] Recommendations")
    add_line("-" * 80)
    
    if success_rate < 50:
        add_line("[!] Low success rate (<50%), suggestions:")
        add_line("   1. Check if agent prompts are clear and specific")
        add_line("   2. Increase max_steps (may not be sufficient)")
        add_line("   3. Use ACIDWAVE_REASONING_AGENT")
        add_line("   4. Verify Acidwave application is running properly")
        add_line("   5. Review screenshots and logs of failed tasks")
    elif success_rate < 80:
        add_line("[*] Moderate success rate (50-80%), suggestions:")
        add_line("   1. Optimize prompts for failed tasks")
        add_line("   2. Adjust temperature parameter")
        add_line("   3. Improve task validation logic")
        add_line("   4. Analyze failure patterns (concentrated in one difficulty?)")
    else:
        add_line("[OK] Excellent success rate (>80%)!")
        add_line("   Consider:")
        add_line("   1. Optimize step efficiency (reduce redundant operations)")
        add_line("   2. Add more challenging tasks")
        add_line("   3. Test with other models (GPT-4o-mini)")
        add_line("   4. Conduct ablation studies")
    
    # Next steps
    add_line(f"\n[>] Next Steps")
    add_line("-" * 80)
    add_line(f"1. View detailed logs:")
    add_line(f"   cd {result_dir}")
    add_line(f"   ls */experiment.log")
    add_line(f"\n2. View screenshots of failed tasks:")
    add_line(f"   cd {result_dir}")
    for failure in failures[:3]:  # Show first 3
        task_name = failure['task_name']
        add_line(f"   ls *{task_name}*/screenshot_*.png")
    
    add_line(f"\n3. Visualize with AgentXray:")
    add_line(f"   agentlab-xray")
    
    add_line("\n" + "="*80)
    
    # Save to file
    if output_file:
        output_file = Path(output_file)
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(report_lines))
        print(f"\n[OK] Report saved to: {output_file}")
    else:
        # Save to default location
        default_output = result_dir / "analysis_report.txt"
        with open(default_output, 'w', encoding='utf-8') as f:
            f.write('\n'.join(report_lines))
        print(f"\n[OK] Report saved to: {default_output}")


def main():
    parser = argparse.ArgumentParser(
        description="Analyze Acidwave experiment results (WebArena style)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Analyze latest results
  python experiments/analyze_results.py results/2025-12-13_18-00-00_full_experiment
  
  # Specify output file
  python experiments/analyze_results.py results/<dir> -o my_report.txt
  
  # Analyze multiple experiments (need to run manually multiple times)
  python experiments/analyze_results.py results/experiment1
  python experiments/analyze_results.py results/experiment2
        """
    )
    
    parser.add_argument(
        'result_dir',
        type=str,
        help='Path to experiment results directory'
    )
    
    parser.add_argument(
        '-o', '--output',
        type=str,
        help='Output report file path (default: <result_dir>/analysis_report.txt)'
    )
    
    args = parser.parse_args()
    
    result_dir = Path(args.result_dir)
    
    if not result_dir.exists():
        print(f"[X] Directory does not exist: {result_dir}")
        sys.exit(1)
    
    generate_report(result_dir, args.output)


if __name__ == "__main__":
    main()


