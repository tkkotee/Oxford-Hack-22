import 'package:flutter/material.dart';

// The state of the new event form at a given time
class FormRadioMenuSelector extends ChangeNotifier {
  // Event date properties
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  bool isAllDay = false;
  String? userAddress;
  List<double>? longLat;

  void resetAddy(String userAddress1, List<double> longLat1) {
    userAddress = userAddress1;
    longLat = longLat1;
    notifyListeners();
  }

  void setDateOnly({required DateTime day, required bool isEndDate}) {
    if (!isEndDate) {
      // Only change date part of dateTime
      selectedStartDate = DateTime(day.year, day.month, day.day,
          selectedStartDate.hour, selectedStartDate.minute);
      notifyListeners();
    } else {
      // Only change date part of dateTime
      selectedEndDate = DateTime(day.year, day.month, day.day,
          selectedEndDate.hour, selectedEndDate.minute);
      notifyListeners();
    }
  }

  void setTimeOnly({required TimeOfDay day, required bool isEndTime}) {
    if (!isEndTime) {
      // Only change time part of dateTime
      selectedStartDate = DateTime(selectedStartDate.year,
          selectedStartDate.month, selectedStartDate.day, day.hour, day.minute);
      notifyListeners();
    } else {
      // Only change time part of dateTime
      selectedEndDate = DateTime(selectedEndDate.year, selectedEndDate.month,
          selectedEndDate.day, day.hour, day.minute);
      notifyListeners();
    }
  }

  void setDateTime({required DateTime date, required bool isEndDate}) {
    if (!isEndDate) {
      // Only change date part of dateTime
      selectedStartDate = date;
      notifyListeners();
    } else {
      // Only change date part of dateTime
      selectedEndDate = date;
      notifyListeners();
    }
  }
}
