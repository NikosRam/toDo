import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/todo_list.dart';

class ToDoListTile extends StatelessWidget {
  final String title;
  final DateTime dueDate;
  final String id;

  const ToDoListTile({
    super.key,
    required this.title,
    required this.dueDate,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(5.0),
        elevation: 4,
        color: const Color.fromARGB(255, 252, 229, 159),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
          ),
          subtitle: Text(
            'Due Date: ${dueDate.toIso8601String().substring(0, 10)}',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              Provider.of<TodoList>(context, listen: false).deleteToDo(id);
            },
          ),
        ),
      ),
    );
  }
}
