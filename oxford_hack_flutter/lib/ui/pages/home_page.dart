import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/comment.dart';
import 'package:oxford_hack_flutter/ui/components/event_widget.dart';
import 'package:oxford_hack_flutter/ui/components/new_event_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const Dialog(
                child: NewEventForm(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          // height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Events',
                  textScaleFactor: 3,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    EventWidget(
                      eventTitle: 'Going to the Shard',
                      startTime: '',
                      endTime: '',
                      location: '',
                      poster: 'Sam Jamerson',
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
                      location: '',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
