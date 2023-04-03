import 'package:flutter/material.dart';

import '../widgets/add_todo_form.dart';

class EditToDo extends StatelessWidget {
  static const routeName = '/edit-todo';

  const EditToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add ToDo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
        elevation: 8,
        backgroundColor: const Color.fromARGB(255, 255, 219, 112),
        iconTheme: const IconThemeData(color: Colors.black, size: 38.0),
      ),
      body: const AddToDoForm(),
    );
  }
}
