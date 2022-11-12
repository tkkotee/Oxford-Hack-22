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
    // Get events
    info = [];
    Map<String, dynamic> response = json.decode((await client.get(
      Uri.parse("http://afb7-192-76-8-95.ngrok.io/events/"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization' : 'Token 20678eafd45daadc6ccb54cf04900d4ae4582b9e'
      },
    ))
        .body);
    info = response.values.map((e) => e.toString()).toList();
    

    // // Get users bearer token
    // var map = new Map<String, dynamic>();
    // map['username'] = 'admin';
    // map['password'] = 'admin';
    // Map<String, dynamic> response = json.decode((await client.post(
    //   Uri.parse("http://efda-192-76-8-95.ngrok.io/api-token-auth/"),
    //   body: map
    //   // headers: {
    //   //   'Content-type': 'application/json',
    //   //   'Accept': 'application/json',
    //   //   'Authorization': base64.encode(utf8.encode('admin:admin'))
    //   // },
    // ))
    //     .body);

    // // Create Event!
    // var map = new Map<String, dynamic>();
    // map["title"] = "Glasgo";
    // map["start_time"] = "2005-02-10T10:25:00Z";
    // map["end_time"] = "2005-02-10T10:25:00Z";
    // map["user_id"] = "1121";

    // Map<String, dynamic> response = json.decode((await client.post(
    //         Uri.parse("http://afb7-192-76-8-95.ngrok.io/events/"),
    //         headers: {
    //           'Content-type': 'application/x-www-form-urlencoded',
    //           'Accept': 'application/json',
    //           'Authorization': 'Token 20678eafd45daadc6ccb54cf04900d4ae4582b9e'
    //         },
    //         body: map))
    //     .body);

    // info = response.values.map((e) => e.toString()).toList();
    // print(info);
    // print(response);

    // Get users token
    //  Map<String, dynamic> response = json.decode((await client.post(
    //   Uri.parse("http://efda-192-76-8-95.ngrok.io/api-token-auth/"),
    //   headers: {
    //     'Content-type': 'application/json',
    //     'Accept': 'application/json',
    //     'Authorization' : base64.encode(utf8.encode('admin:admin'))
    //   },
    // ))
    //     .body);

    // info = response.values.map((e) => e.toString()).toList();
    // print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.red,
      child: Column(
        children: info.map((text) => Text(text)).toList(),
      ),
    );
  }
}
