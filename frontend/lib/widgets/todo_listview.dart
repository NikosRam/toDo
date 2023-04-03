import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../widgets/todo_list_tile.dart';
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
    final toDoData = Provider.of<TodoList>(context);
    final toDos = toDoData.toDos;
    return ListView.builder(
      itemCount: toDos.length,
      itemBuilder: (context, index) {
        return ToDoListTile(
          title: toDos[index].title,
          dueDate: toDos[index].dueDate,
          id: toDos[index].id,
        );
      },
    );
  }
}
