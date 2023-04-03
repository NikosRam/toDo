import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

class TodoList with ChangeNotifier {
  List<ToDo> _toDos = [];

  List<ToDo> get toDos {
    return [..._toDos];
  }

  Future<void> getAllToDos() async {
    try {
      final url = Uri.parse("http://10.0.2.2:8000/api/v1/todo/");

      final prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('token');
      print(jwt);

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt'
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

      final prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('token');

      await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt'
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

  Future<void> createToDo(String title) async {
    try {
      final url = Uri.parse("http://10.0.2.2:8000/api/v1/todo/");

      final prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('token');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt'
        },
        body: json.encode({
          'title': title,
        }),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedToDo = extractedData['data']['toDo'];

      _toDos.add(ToDo(
          title: title,
          dueDate: DateTime.parse(extractedToDo['dueDate']),
          id: extractedToDo['_id']));

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
