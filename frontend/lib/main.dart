import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/todo_list.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/todos_overview_screen.dart';

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
        home: const ToDosOverviewScreen(),
      ),
    );
  }
}
