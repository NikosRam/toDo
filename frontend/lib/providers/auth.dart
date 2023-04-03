import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/v1/users/login");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          "Authorization":
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MTVkYWI2OWQwNmU0NWI5NDgxODhlMSIsImlhdCI6MTY3OTE1NDEzMCwiZXhwIjoxNjg2OTMwMTMwfQ.7QABQBUFGrQFuyu0cXCEvGJK-qf2K2hFDjeM_AeRLh4',
          'Content-Type': 'application/json'
        },
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
