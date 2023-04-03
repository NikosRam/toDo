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
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<TodoList>(context, listen: false).getAllToDos().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final toDoData = Provider.of<TodoList>(context);
    final toDos = toDoData.toDos;
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
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
