import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;

  Future<void> signup(String name, String email, String password) async {
    final url = Uri.parse("http://127.0.0.1:8000");

    final response = await http.post(
      url,
      body: json.encode(
        {
          "name": name,
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
