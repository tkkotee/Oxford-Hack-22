import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oxford_hack_flutter/providers/login_provider.dart';

import '../django/rest.dart';

class EventProvider extends ChangeNotifier {
  Client client = http.Client();

  Future<List<List<Event>>> getUsersEvents(User user) async {
    var response = json.decode((await client.get(
      Uri.parse(
          "http://397f-192-76-8-95.ngrok.io/eventsbyuser/${user.username}"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token ${user.userToken}'
      },
    ))
        .body);
    List<dynamic> responseResults = response['results'];

    print(responseResults);

    List<List<Event>> eventsWithNearbyEvents = [];
    for (dynamic eventJson in responseResults) {
      Event mainEvent = Event.fromJson(eventJson);

      print(mainEvent.eventId);

      var nearbyResponse = json.decode((await client.get(
        Uri.parse(
            "http://397f-192-76-8-95.ngrok.io/findlocalevents/${eventJson['event_id']}"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token ${user.userToken}',
        },
      ))
          .body);
      List<dynamic> nearbyResponseResults = nearbyResponse['results'];

      print(nearbyResponseResults);
      List<Event> listOfNearbyEvents =
          nearbyResponseResults.map((json2) => Event.fromJson(json2)).toList();

      eventsWithNearbyEvents.add([mainEvent, ...listOfNearbyEvents]);
    }

    return eventsWithNearbyEvents;
  }

  Future<void> createEvents(
      String title,
      String startTime,
      String endTime,
      String username,
      String longitude,
      String latitude,
      String eventId) async {
    Map<String, dynamic> response = json.decode((await client.post(
            Uri.parse("http://397f-192-76-8-95.ngrok.io/events/"),
            headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          'Authorization': 'Token 20678eafd45daadc6ccb54cf04900d4ae4582b9e'
        },
            body: {
          'title': title,
          'start_time': startTime,
          'end_time': endTime,
          'username': username,
          'longitude': longitude,
          'latitude': latitude,
          'event_id': eventId,
        }))
        .body);
    notifyListeners();
  }
}
