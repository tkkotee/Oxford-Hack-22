import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/profile_icon.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.eventTitle,
    required this.startTime,
    required this.endTime,
    required this.location,
    this.poster = 'you',
  });

  final String eventTitle;
  final String startTime;
  final String endTime;
  final String location;
  final String poster;

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
              ? Color.fromARGB(255, 185, 252, 107)
              : Color.fromARGB(255, 107, 252, 250),
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
                  eventTitle,
                  textScaleFactor: 1.5,
                ),
                const Text(
                  '15 Nov',
                  textScaleFactor: 1.5,
                )
              ],
            ),
            const SizedBox(height: 2),
            Text('by $poster'),
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
                const Text('123 Streetname\nLondon'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text('Joined by: '),
                ProfileIcon(
                  firstName: 'Tarun',
                  surname: 'Koteeswaran',
                  isSmall: true,
                ),
                SizedBox(width: 5),
                ProfileIcon(
                  firstName: 'Danny',
                  surname: 'Ali',
                  isSmall: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
