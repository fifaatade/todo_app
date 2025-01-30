import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task.dart';
import '../../data/providers/task_provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                    return Checkbox(
                      value: taskProvider.allCompleted,
                      tristate: true,
                      onChanged: (completed) {
                        taskProvider.toggleAllCompleted(completed ?? false);
                      },
                    );
                  },
                ),
                Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                    return ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        var newState = switch (index) {
                          0 => DisplayState.all,
                          1 => DisplayState.active,
                          _ => DisplayState.completed
                        };
                        taskProvider.updateDisplayState(newState);
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedColor: Colors.white,
                      fillColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 12),
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 90,
                      ),
                      isSelected: [
                        taskProvider.displayState == DisplayState.all,
                        taskProvider.displayState == DisplayState.active,
                        taskProvider.displayState == DisplayState.completed,
                      ],
                      children: [
                        Text("Tout (${taskProvider.allCount})"),
                        Text("En cours (${taskProvider.activeCount})"),
                        Text("Terminé (${taskProvider.completedCount})"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SliverList.separated(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(task: task);
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.grey[100],
            );
          },
        ),
      ],
    );
  }
}
