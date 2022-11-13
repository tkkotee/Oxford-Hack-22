import 'package:flutter/material.dart';

// The enum which contains the different radio menu types
enum MenuOptions { eventType, repetition, paidFor, paidBy, people, color }

// Class to allow us to take advantage of the repetition option selected in the provider
class AddRepetition {
  // Implement repetition
  static DateTime addRepetition(DateTime currentDate, String repetition) {
    if (repetition == 'Year') {
      return DateTime(currentDate.year + 1, currentDate.month, currentDate.day,
          currentDate.hour, currentDate.minute);
    } else if (repetition == 'Monthly') {
      return DateTime(currentDate.year, (currentDate.month + 1) % 13,
          currentDate.day, currentDate.hour, currentDate.minute);
    } else if (repetition == 'Weekly') {
      return currentDate.add(const Duration(days: 7));
    } else if (repetition == 'Daily') {
      return currentDate.add(const Duration(days: 1));
    } else {
      return currentDate;
    }
  }
}

// The state of the new event form at a given time
class FormRadioMenuSelector extends ChangeNotifier {
  // Initialise set values allowed
  final List<String> _repetitionOptions = [
    'Does Not Repeat',
    'Daily',
    'Weekly',
    'Monthly',
    'Year'
  ];

  final List<List<Color>> _colorOptions = const [
    [Color.fromARGB(255, 203, 255, 218), Color.fromARGB(255, 155, 223, 244)],
    [Color.fromRGBO(144, 255, 57, 1), Color.fromRGBO(251, 255, 36, 0.98)],
    [Color.fromRGBO(255, 208, 225, 1), Color.fromRGBO(145, 135, 255, 1)],
    [
      Color.fromRGBO(238, 194, 38, 98),
      Color.fromRGBO(250, 96, 34, 100),
    ],
  ];

  List<List<Color>> get colorOptions => _colorOptions;
  List<String> get repetitionOptions => _repetitionOptions;

  // Event date properties
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  bool isAllDay = false;

  // The types of menus that can be pulled up from form and their currently selected value
  Map<MenuOptions, num?> menuOptionsSelected = {
    MenuOptions.repetition: 0,
    MenuOptions.paidBy: 0,
    MenuOptions.eventType: 0,
    MenuOptions.color: 0,
  };

  // The types of multi select menus that can be pulled up from form and their currently selected values
  Map<MenuOptions, List<int>?> menuOptionsMultiSelected = {
    MenuOptions.paidFor: [0],
    MenuOptions.people: [0]
  };

  // Set one of the menus to a given value
  void setSelected(MenuOptions menuOptions, num? value) {
    menuOptionsSelected[menuOptions] = value;
    notifyListeners();
  }

  // Set one of the multi select menus to a given set of values
  void setMultiSelected(MenuOptions menuOptions, List<int> indices) {
    menuOptionsMultiSelected[menuOptions] = indices;
    notifyListeners();
  }

  void onMultiSelectTap(MenuOptions menuOptions, int index) {
    // If more than one item is selected remove it from provider list
    if (menuOptionsMultiSelected[menuOptions]!.contains(index) &&
        menuOptionsMultiSelected[menuOptions]!.length > 1) {
      menuOptionsMultiSelected[menuOptions]!.remove(index);
      notifyListeners();
      // Else if index is not already selected add it to the provider list
    } else if (!menuOptionsMultiSelected[menuOptions]!.contains(index)) {
      menuOptionsMultiSelected[menuOptions]!.add(index);
      notifyListeners();
    }
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
