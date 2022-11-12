import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Client client = http.Client();
  List<String> info = [];

  @override
  void initState() {
    _retrieveInfo();
    super.initState();
  }

  _retrieveInfo() async {
    info = [];

    Map<String, dynamic> response = json.decode(
        (await client.get(Uri.parse('http://127.0.0.1:8000/users/'))).body);

    info = response.values.map((e) => e.toString()).toList();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(40),
        color: Colors.red,
        child: Column(
          children: info.map((text) => Text(text)).toList(),
        ));
  }
}
