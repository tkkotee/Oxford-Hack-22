import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;

class Event {
  String eventTitle;
  DateTime startTime;
  DateTime endTime;
  // List<String> location;
  String uid;
  String? name;

  Event({
    required this.eventTitle,
    required this.startTime,
    required this.endTime,
    // required this.location,
    required this.uid,
    this.name,
  });

  static Event fromJson(Map<String, dynamic> json) {
    DateTime parsedStartTime = DateTime.parse(json['start_time']);
    DateTime parsedEndTime = DateTime.parse(json['end_time']);
    // List<dynamic> dynamicLocation = [json['longitude'], json['latidude']];

    return Event(
      eventTitle: json['title'] as String,
      startTime: parsedStartTime,
      endTime: parsedEndTime,
      // location: dynamicLocation.map((e) => e.toString()).toString() as List<String>,
      uid: json['user_id'],
    );
  }
}
