import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oxford_hack_flutter/providers/login_provider.dart';

import '../django/rest.dart';

class EventProvider extends ChangeNotifier {
  Client client = http.Client();

  Future<List<Event>> getUsersEvents(User user) async {
    var response = json.decode((await client.get(
      Uri.parse("http://397f-192-76-8-95.ngrok.io/eventsbyuser/${user.username}"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token ${user.userToken}'
      },
    ))
        .body);
    List<dynamic> responseResults = response['results'];
    List<Event> events = [];
    for (dynamic json in responseResults) {
      events.add(Event.fromJson(json));
    }

    return events;
  }
}
