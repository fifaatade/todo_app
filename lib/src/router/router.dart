import 'package:go_router/go_router.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/add_task_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'welcome',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/task',
    builder: (context, state) => AddTaskScreen(),
  ),
]);
