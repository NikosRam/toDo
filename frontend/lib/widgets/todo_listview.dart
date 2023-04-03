import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_list.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({super.key});

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoList>(context, listen: false).getAllToDos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
