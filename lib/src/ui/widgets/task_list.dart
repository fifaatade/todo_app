import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/task_provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return TaskTile(
              title: task.title,
              isDone: task.isDone,
              onToggle: () => taskProvider.toggleTaskStatus(index),
              onDelete: () => taskProvider.deleteTask(index),
            );
          },
        );
      },
    );
  }
}
