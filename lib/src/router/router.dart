import 'package:go_router/go_router.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/add_task_screen.dart';
import '../ui/screens/edit_task_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/add',
      name: 'add',
      builder: (context, state) => const AddTaskScreen(),
    ),
    GoRoute(
      path: '/edit/:id', // :id est un paramètre dynamique
      name: 'edit',
      builder: (context, state) {
        // Récupère l'ID de la tâche depuis les pathParameters
        final taskId = int.parse(state.pathParameters['id']!);
        return EditTaskScreen(taskId: taskId);
      },
    ),
  ],
);
