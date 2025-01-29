import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/task_provider.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/task'),
        child: Icon(Icons.add),
      ),
    );
  }
}
