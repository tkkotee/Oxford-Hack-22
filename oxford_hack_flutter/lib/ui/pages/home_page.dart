import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/comment.dart';
import 'package:oxford_hack_flutter/ui/components/event_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Events',
                textScaleFactor: 3,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  EventWidget(
                    eventTitle: 'Going to the Shard',
                    startTime: '',
                    endTime: '',
                  ),
                  CommentsWidget(
                    comments: [
                      'Hey I\'d love to join',
                      'Me too pls!',
                    ],
                  ),
                  SizedBox(height: 10),
                  EventWidget(
                    eventTitle: 'Oxford Hackathon',
                    startTime: '',
                    endTime: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
