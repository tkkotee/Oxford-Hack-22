import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/profile_icon.dart';

class EventWidget extends StatelessWidget {
  const EventWidget(
      {super.key,
      required this.eventTitle,
      required this.startTime,
      required this.endTime});

  final String eventTitle;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Going to the shard',
                textScaleFactor: 1.5,
              ),
              Text(
                '15 - Nov',
                textScaleFactor: 1.5,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
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
    );
  }
}
