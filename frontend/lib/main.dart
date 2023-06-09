import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/todo_list.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/todos_overview_screen.dart';
import 'screens/add_todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => TodoList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthScreen(),
        routes: {
          EditToDo.routeName: (context) => const EditToDo(),
          ToDosOverviewScreen.routeName: (context) =>
              const ToDosOverviewScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
        },
      ),
    );
  }
}
