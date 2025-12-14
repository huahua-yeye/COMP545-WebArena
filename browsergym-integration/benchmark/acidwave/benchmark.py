"""
Acidwave Benchmark for WebArena-Pro
====================================

Custom benchmark for testing web agents on music player tasks.
Based on BrowserGym's benchmark system.
"""

from browsergym.experiments.benchmark.base import Benchmark
from pathlib import Path
import json
import logging

logger = logging.getLogger(__name__)


class AcidwaveBenchmark(Benchmark):
    """
    Acidwave Music Player Benchmark

    A benchmark for evaluating web agents on realistic music player
    interaction tasks, including navigation, search, playback control,
    and playlist management.

    Tasks range from simple (navigate to view) to complex
    (create playlist with multiple songs and play it).

    Example:
        >>> from benchmark.acidwave import AcidwaveBenchmark
        >>> benchmark = AcidwaveBenchmark()
        >>> print(f"Loaded {len(benchmark)} tasks")
        Loaded 16 tasks
    """

    def __init__(
        self,
        task_file: Path = None,
        task_subset: list = None
    ):
        """
        Initialize Acidwave Benchmark

        Args:
            task_file: Path to test.raw.json file. If None, uses default.
            task_subset: Optional list of task IDs to include. If None, uses all tasks.
        """
        # Load task specifications
        if task_file is None:
            task_file = Path(__file__).parent / "test.raw.json"

        logger.info(f"Loading Acidwave tasks from: {task_file}")

        with open(task_file, 'r', encoding='utf-8') as f:
            all_tasks = json.load(f)

        # Filter tasks if subset specified
        if task_subset is not None:
            tasks = [t for t in all_tasks if t['task_id'] in task_subset]
            logger.info(f"Using task subset: {len(tasks)}/{len(all_tasks)} tasks")
        else:
            tasks = all_tasks

        # Create EnvArgs for each task
        from browsergym.experiments.loop import EnvArgs
        from browsergym.experiments.benchmark.base import HighLevelActionSetArgs

        env_args_list = []
        for task in tasks:
            # Task name WITHOUT prefix (BrowserGym adds it when making env)
            env_args = EnvArgs(
                task_name=f"acidwave.task_{task['task_id']}",
                task_seed=0,
                task_kwargs={
                    "start_url": task["start_url"],
                    "goal": task["intent"],
                }
            )
            env_args_list.append(env_args)

        # Initialize parent Benchmark
        super().__init__(
            name="acidwave",
            high_level_action_set_args=HighLevelActionSetArgs(
                subsets=["bid", "coord", "nav"]  # Basic action subsets
            ),
            is_multi_tab=False,
            supports_parallel_seeds=False,
            env_args_list=env_args_list,
            backends=[],  # Custom backend
        )

        # Store tasks
        self._tasks = tasks

        logger.info(f"[OK] Acidwave benchmark initialized with {len(tasks)} tasks")

    def __len__(self):
        """Return number of tasks"""
        return len(self._tasks)

    def __getitem__(self, idx):
        """Get task by index"""
        return self._tasks[idx]

    def get_task_by_id(self, task_id: int):
        """
        Get task configuration by task ID

        Args:
            task_id: Task ID number

        Returns:
            Task configuration dictionary
        """
        for task in self._tasks:
            if task["task_id"] == task_id:
                return task
        raise ValueError(f"Task ID {task_id} not found")

    def get_tasks_by_difficulty(self, difficulty: str):
        """
        Get all tasks of a specific difficulty level

        Args:
            difficulty: One of "easy", "medium", "hard"

        Returns:
            List of task configurations
        """
        return [t for t in self._tasks if t.get("difficulty") == difficulty]

    def get_task_ids(self):
        """Get list of all task IDs"""
        return [t["task_id"] for t in self._tasks]

    def summary(self):
        """Print benchmark summary"""
        print("\n" + "="*60)
        print("ACIDWAVE BENCHMARK SUMMARY")
        print("="*60)
        print(f"Total tasks: {len(self._tasks)}")

        # Count by difficulty
        easy = len(self.get_tasks_by_difficulty("easy"))
        medium = len(self.get_tasks_by_difficulty("medium"))
        hard = len(self.get_tasks_by_difficulty("hard"))

        print(f"\nBy difficulty:")
        print(f"  Easy:   {easy}")
        print(f"  Medium: {medium}")
        print(f"  Hard:   {hard}")

        print(f"\nTask IDs: {self.get_task_ids()}")
        print("="*60 + "\n")


# Create default benchmark instance
DEFAULT_ACIDWAVE_BENCHMARK = AcidwaveBenchmark()


if __name__ == "__main__":
    # Demo usage
    print("Testing Acidwave Benchmark...")

    # Create benchmark
    benchmark = AcidwaveBenchmark()

    # Show summary
    benchmark.summary()

    # Show sample tasks
    print("\nSample Easy Task:")
    easy_tasks = benchmark.get_tasks_by_difficulty("easy")
    if easy_tasks:
        task = easy_tasks[0]
        print(f"  ID: {task['task_id']}")
        print(f"  Intent: {task['intent']}")
        print(f"  Difficulty: {task['difficulty']}")

    print("\nSample Hard Task:")
    hard_tasks = benchmark.get_tasks_by_difficulty("hard")
    if hard_tasks:
        task = hard_tasks[0]
        print(f"  ID: {task['task_id']}")
        print(f"  Intent: {task['intent']}")
        print(f"  Difficulty: {task['difficulty']}")

    print("\n[OK] Benchmark test complete!")
