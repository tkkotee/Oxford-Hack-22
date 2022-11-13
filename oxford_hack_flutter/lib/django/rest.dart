class Event {
  String eventTitle;
  DateTime startTime;
  DateTime endTime;
  List<double> location;
  String username;
  String? name;
  String eventId;

  Event({
    required this.eventTitle,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.username,
    this.name,
    required this.eventId,
  });

  static Event fromJson(Map<String, dynamic> json) {
    DateTime parsedStartTime = DateTime.parse(json['start_time']);
    DateTime parsedEndTime = DateTime.parse(json['end_time']);
    List<dynamic> dynamicLocation = [json['longitude'], json['latidude']];

    return Event(
      eventTitle: json['title'] as String,
      startTime: parsedStartTime,
      endTime: parsedEndTime,
      location:
          dynamicLocation.map((e) => double.parse(e)).toList(),
      username: json['username'],
      eventId: json['event_id']
    );
  }
}
