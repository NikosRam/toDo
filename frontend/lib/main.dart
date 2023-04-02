import 'package:flutter/material.dart';
import 'package:frontend/providers/auth.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';

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
          create: (context) => Auth(),
        )
      ],
      child: MaterialApp(
        title: 'todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
