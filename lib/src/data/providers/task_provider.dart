import 'package:flutter/material.dart';
import '../../data/datasources/local_storage.dart';
import '../models/task.dart';

// Énumération pour les états d'affichage des tâches
enum DisplayState {
  all,
  active,
  completed,
}

class TaskProvider with ChangeNotifier {
  final LocalStorage _localStorage = LocalStorage();
  List<Task> _tasks = [];
  DisplayState _displayState = DisplayState.all;

  // Getter pour la liste des tâches filtrées
  List<Task> get tasks {
    switch (_displayState) {
      case DisplayState.active:
        return _tasks.where((task) => !task.completed).toList();
      case DisplayState.completed:
        return _tasks.where((task) => task.completed).toList();
      default:
        return _tasks;
    }
  }

  // Getter pour l'état d'affichage actuel
  DisplayState get displayState => _displayState;

  // Getter pour le nombre total de tâches
  int get allCount => _tasks.length;

  // Getter pour le nombre de tâches actives
  int get activeCount => _tasks.where((task) => !task.completed).length;

  // Getter pour le nombre de tâches terminées
  int get completedCount => _tasks.where((task) => task.completed).length;

  // Getter pour vérifier si toutes les tâches sont terminées
  bool get allCompleted => _tasks.every((task) => task.completed);

  // Charger les tâches depuis SharedPreferences
  Future<void> loadTasks() async {
    _tasks = await _localStorage.getTasks();
    notifyListeners();
  }

  // Ajouter une tâche
  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _localStorage.saveTasks(_tasks);
    notifyListeners();
  }

  // Mettre à jour une tâche
  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      await _localStorage.saveTasks(_tasks);
      notifyListeners();
    }
  }

  // Supprimer une tâche
  Future<void> deleteTask(int taskId) async {
    _tasks.removeWhere((t) => t.id == taskId);
    await _localStorage.saveTasks(_tasks);
    notifyListeners();
  }

  // Basculer l'état de complétion de toutes les tâches
  Future<void> toggleAllCompleted(bool completed) async {
    for (var task in _tasks) {
      task.completed = completed;
    }
    await _localStorage.saveTasks(_tasks);
    notifyListeners();
  }

  // Mettre à jour l'état d'affichage
  void updateDisplayState(DisplayState newState) {
    _displayState = newState;
    notifyListeners();
  }

  // Basculer l'état de complétion d'une tâche spécifique
  Future<void> toggleComplete(Task task) async {
    task.completed = !task.completed;
    await _localStorage.saveTasks(_tasks);
    notifyListeners();
  }
}
