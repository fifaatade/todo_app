import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nom de la tâche'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(_controller.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Ajouter'),
            )
          ],
        ),
      ),
    );
  }
}
