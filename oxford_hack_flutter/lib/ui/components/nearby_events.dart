import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/nested_event_widget.dart';
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
    if (nearbyEvents.isNotEmpty) {
      return Container(
        height: (40 * nearbyEvents.length).toDouble(),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 2,
              height: (40 * (nearbyEvents.length - 1)).toDouble() + 21,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nearbyEvents
                    .map(
                      (event) => SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 5,
                              height: 2,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: NestedEventWidget(
                                eventTitle: event.eventTitle,
                                username: event.username,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
