import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/profile_icon.dart';
import '../../django/rest.dart';

class NearbyEvents extends StatelessWidget {
  const NearbyEvents({
    super.key,
    required this.nearbyEvents,
  });

  final List<Event> nearbyEvents;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (30 * nearbyEvents.length).toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 2,
            height: (30 * (nearbyEvents.length - 1)).toDouble() + 16,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: nearbyEvents
                .map(
                  (event) => SizedBox(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 5,
                          height: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(event.eventTitle),
                        // const Spacer(),
                        ProfileIcon(
                          firstName: event.username,
                          isSmall: true,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
