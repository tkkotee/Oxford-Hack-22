import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/providers/event_provider.dart';
import 'package:oxford_hack_flutter/ui/components/comment.dart';
import 'package:oxford_hack_flutter/ui/components/event_widget.dart';
import 'package:oxford_hack_flutter/ui/components/new_event_form.dart';
import 'package:provider/provider.dart';

import '../../django/rest.dart';

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
                child: FutureBuilder<List<Event>>(
                    future: Provider.of<EventProvider>(context, listen: false)
                        .getUsersEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: [
                            SizedBox(height: 10),
                            ...snapshot.data!
                              .map((event) => Column(
                                    children: [
                                      EventWidget(
                                        event: event,
                                        joinedByList: const [
                                          ['Harry', 'James'],
                                          ['john', 'haine']
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ))
                              .toList()],
                        );
                      } else {
                        return Text('loading');
                      }

                      // const [
                      // EventWidget(
                      //   event: ,
                      //   joinedByList: [
                      //     ['Harry', 'James'],
                      //     ['john', 'haine']
                      //   ],
                      // ),
                      // CommentsWidget(
                      //   comments: [
                      //     'Hey I\'d love to join',
                      //     'Me too pls!',
                      //   ],
                      // ),
                      // SizedBox(height: 10),
                      // EventWidget(
                      //   eventTitle: 'Oxford Hackathon',
                      //   startTime: '',
                      //   endTime: '',
                      //   location: '',
                      //   joinedByList: [],
                      // ),
                      // SizedBox(height: 20),
                      // ],
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
