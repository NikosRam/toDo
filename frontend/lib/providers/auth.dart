import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token;

  Future<void> signup(String name, String email, String password) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/v1/users/signup");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );
      if (json.decode(response.body)['error'] != null) {
        throw Error();
      }

      final jwt = json.decode(response.body)['token'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jwt);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/v1/users/login");

    try {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('token')) {
        throw Error();
      }

      var jwt = prefs.getString('token');

      final response = await http.post(
        url,
        headers: <String, String>{
          "Authorization": 'Bearer $jwt',
          'Content-Type': 'application/json'
        },
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      if (json.decode(response.body)['error'] != null) {
        throw Error();
      }

      jwt = json.decode(response.body)['token'];
      prefs.setString('token', jwt!);

      if (!prefs.containsKey('token')) {
        throw Error();
      }
    } catch (error) {
      rethrow;
    }
  }
}
