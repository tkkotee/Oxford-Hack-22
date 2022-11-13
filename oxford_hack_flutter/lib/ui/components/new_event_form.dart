import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/custom_date_picker.dart';
import 'package:oxford_hack_flutter/ui/components/location_picker.dart';

class NewEventForm extends StatefulWidget {
  const NewEventForm({super.key});

  @override
  State<NewEventForm> createState() => _NewEventFormState();
}

class _NewEventFormState extends State<NewEventForm> {

    final titleController = TextEditingController();
    final locationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,0,0),
            child: TextField(
              autofocus: true,
              controller: titleController,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'Event title',
                border: InputBorder.none,
              ),
            ),
          ),
          const CustomDatePickerDialog(isEnd: false),
          const CustomDatePickerDialog(
            isEnd: true,
          ),
          LocationPicker(
            controller: locationTextController,

          ),
          // const AllDayToggle(),
          // const RepetitionRadioMenuDialog(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}