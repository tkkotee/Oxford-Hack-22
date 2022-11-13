// The row which displays the date and opens the date and time picker dialogs
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/form_and_radio_menu_provider.dart';

class CustomDatePickerDialog extends StatelessWidget {
  const CustomDatePickerDialog(
      {Key? key, this.onChanged, required this.isEnd, this.hasBorder = false})
      : super(key: key);

  final VoidCallback? onChanged;
  final bool isEnd;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Consumer<FormRadioMenuSelector>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: hasBorder ? Colors.grey : Colors.transparent,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Clock Icon
              isEnd
                  ? const SizedBox(width: 24)
                  : const Icon(Icons.schedule_outlined),
              const SizedBox(width: 21),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020, 1, 1),
                      lastDate: DateTime(2030, 1, 1));
                  if (selectedDate != null) {
                    provider.setDateOnly(day: selectedDate, isEndDate: isEnd);
                  }
                },
                // Currently selected date
                child: Text(
                  isEnd
                      ? DateFormat('EEE, MMM d, ' 'yyyy')
                          .format(provider.selectedEndDate)
                      : DateFormat('EEE, MMM d, ' 'yyyy')
                          .format(provider.selectedStartDate),
                          textScaleFactor: 1,
                  style: const TextStyle(
                     fontWeight: FontWeight.w700),
                ),
              ),
              const Spacer(),
              // Currently selected time
              GestureDetector(
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    initialTime: isEnd
                        ? TimeOfDay(
                            hour: DateTime.now().minute > 30
                                ? DateTime.now().hour + 2 % 25
                                : DateTime.now().hour + 1 % 25,
                            minute: 30)
                        : TimeOfDay(
                            hour: DateTime.now().minute > 30
                                ? DateTime.now().hour + 1 % 25
                                : DateTime.now().hour,
                            minute: 30),
                    context: context,
                  );
                  if (selectedTime != null) {
                    provider.setTimeOnly(day: selectedTime, isEndTime: isEnd);
                  }
                },
                child: Text(
                  isEnd
                      ? DateFormat.Hm().format(provider.selectedEndDate)
                      : DateFormat.Hm().format(provider.selectedStartDate),
                      textScaleFactor: 1,
                  style: const TextStyle(
                     fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

