import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task.dart';
import '../../data/providers/task_provider.dart';
import 'package:go_router/go_router.dart'; // Importe GoRouter

class EditTaskScreen extends StatelessWidget {
  final int taskId;

  const EditTaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.tasks.firstWhere((t) => t.id == taskId);

    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController(text: task.title);
    final _descriptionController =
        TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier la tâche"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Titre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le titre est requis";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedTask = Task(
                      id: task.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      completed: task.completed,
                    );
                    taskProvider.updateTask(updatedTask);
                    // Revenir à l'écran principal après la modification
                    context.go('/');
                  }
                },
                child: const Text("Modifier"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
