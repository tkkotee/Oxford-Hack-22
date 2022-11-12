import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oxford_hack_flutter/ui/components/joined_by.dart';

import '../../django/rest.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.event,
    this.poster = 'you',
    required this.joinedByList,
  });

  final Event event;
  final String poster;
  final List<List<String>> joinedByList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: poster == 'you'
              ? const Color.fromARGB(255, 185, 252, 107)
              : const Color.fromARGB(255, 107, 252, 250),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.eventTitle,
                  textScaleFactor: 1.5,
                ),
                Text(
                  '${event.startTime.day} ${DateFormat.MMM().format(event.startTime)}',
                  textScaleFactor: 1.5,
                )
              ],
            ),
            const SizedBox(height: 2),
            Text('by ${event.uid}'),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                // Text('${event.location[0]} , ${event.location[1]}'),
              ],
            ),
            const SizedBox(height: 10),
            JoinedBy(
              friends: joinedByList,
              isOwnEvent: poster == 'you',
            )
          ],
        ),
      ),
    );
  }
}
