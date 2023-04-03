import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoList with ChangeNotifier {
  List<ToDo> _toDos = [];

  List<ToDo> get toDos {
    return [..._toDos];
  }

  Future<void> getAllToDos() async {
    try {
      final url = Uri.parse("http://10.0.2.2:8000/api/v1/todo/");

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MmFkYTMzNzFjNGY0MWE5NDE5NGJjNiIsImlhdCI6MTY4MDUzMDEwNiwiZXhwIjoxNjg4MzA2MTA2fQ.WTrsjcTYgTl-xJDeSGnZvUeYepmCcZRtOwFGvZXMrKM'
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> extractedToDos = extractedData['data']['toDos'];
      final List<ToDo> loadedTodos = [];

      for (var i = 0; i < extractedToDos.length; i++) {
        loadedTodos.add(
          ToDo(
            title: extractedToDos[i]['title'],
            dueDate: DateTime.parse(
              extractedToDos[i]['dueDate'],
            ),
            id: extractedToDos[i]['_id'],
          ),
        );
      }

      _toDos = loadedTodos;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteToDo(String id) async {
    final existingToDoIndex = _toDos.indexWhere((todo) => todo.id == id);
    ToDo? existingToDo = _toDos[existingToDoIndex];

    try {
      final url = Uri.parse("http://10.0.2.2:8000/api/v1/todo/$id");

      await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MmFkYTMzNzFjNGY0MWE5NDE5NGJjNiIsImlhdCI6MTY4MDUzMDEwNiwiZXhwIjoxNjg4MzA2MTA2fQ.WTrsjcTYgTl-xJDeSGnZvUeYepmCcZRtOwFGvZXMrKM'
        },
      );

      existingToDo = null;
      _toDos.removeWhere((todo) => todo.id == id);

      notifyListeners();
    } catch (error) {
      _toDos.insert(existingToDoIndex, existingToDo!);
      notifyListeners();
      rethrow;
    }
  }
}
