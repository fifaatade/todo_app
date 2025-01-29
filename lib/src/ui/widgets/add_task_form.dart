import 'package:flutter/material.dart';

class AddTaskForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  AddTaskForm({required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Nom de la tâche'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onSubmit,
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
