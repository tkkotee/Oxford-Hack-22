import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/custom_date_picker.dart';
import 'package:oxford_hack_flutter/ui/components/description_text.dart';
import 'package:oxford_hack_flutter/ui/components/location_picker.dart';

class NewEventForm extends StatefulWidget {
  const NewEventForm({super.key});

  @override
  State<NewEventForm> createState() => _NewEventFormState();
}

class _NewEventFormState extends State<NewEventForm> {

    final titleController = TextEditingController();
    final descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 280,
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
        mainAxisSize: MainAxisSize.min,
        children:  [
          const Expanded(
            child:  LocationPicker(
              ),
          ),
          const CustomDatePickerDialog(isEnd: false),
          const CustomDatePickerDialog(
            isEnd: true,
          ),
          DescriptionTextField(controller: descriptionTextController),
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