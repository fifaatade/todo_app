import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task.dart';
import '../../data/providers/task_provider.dart';
import 'package:go_router/go_router.dart'; // Importe GoRouter

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              taskProvider.toggleComplete(task);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: task.completed ? Colors.green : Colors.grey[600]!,
                  width: 2,
                ),
                color: task.completed ? Colors.green : null,
              ),
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(top: 6),
              alignment: Alignment.center,
              child: task.completed
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration:
                        task.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  task.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    decoration:
                        task.completed ? TextDecoration.lineThrough : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Utilise GoRouter pour naviguer vers l'écran d'édition avec l'ID de la tâche
              context.go('/edit/${task.id}');
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              taskProvider.deleteTask(task.id);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
