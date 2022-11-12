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
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: const [
            EventWidget(
              eventTitle: '',
              startTime: '',
              endTime: '',
            ),
            CommentsWidget(comments: ['Hey I\'d love to join']),
            CommentsWidget(comments: ['Me too pls!']),
          ],
        ),
      ),
    );
  }
}
