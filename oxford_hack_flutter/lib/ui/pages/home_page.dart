import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/event_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.black,
        child: const EventWidget(
          eventTitle: '',
          startTime: '',
          endTime: '',
        ),
      ),
    );
  }
}
