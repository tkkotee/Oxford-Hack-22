import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class User {
  String username;
  String userToken;

  User({
    required this.username,
    required this.userToken,
  });
}

class LoginProvider extends ChangeNotifier {
  Client client = http.Client();

  User? user;

  postUserLogin(String lensHandle, String password) async {
    final response = await client.post(
      Uri.parse("http://397f-192-76-8-95ad.ngrok.io/api-token-auth/"),
      body: {
        'username': lensHandle,
        'password': password,
      },
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        // 'Authorization': base64.encode(utf8.encode('admin:admin')),
      },
    );
    // print(response);
    Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      user = User(
        username: decodedResponse['username'],
        userToken: decodedResponse['token'],
      );
    } else {
      print(response.statusCode);
    }

    notifyListeners();
  }
}
