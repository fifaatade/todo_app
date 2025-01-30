import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import 'dart:convert';

class LocalStorage {
  static const _tasksKey = 'tasks'; // Clé pour stocker les tâches

  // Récupérer toutes les tâches
  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey) ?? [];
    return tasksJson.map((json) => Task.fromMap(jsonDecode(json))).toList();
  }

  // Sauvegarder toutes les tâches
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => jsonEncode(task.toMap())).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  // Ajouter une tâche
  Future<void> addTask(Task task) async {
    final tasks = await getTasks();
    tasks.add(task);
    await saveTasks(tasks);
  }

  // Mettre à jour une tâche
  Future<void> updateTask(Task updatedTask) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await saveTasks(tasks);
    }
  }

  // Supprimer une tâche
  Future<void> deleteTask(int taskId) async {
    final tasks = await getTasks();
    tasks.removeWhere((task) => task.id == taskId);
    await saveTasks(tasks);
  }
}
