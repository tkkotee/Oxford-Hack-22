import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:oxford_hack_flutter/ui/components/joined_by.dart';

import '../../django/rest.dart';

class EventWidget extends StatefulWidget {
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
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.poster == 'you'
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
                  widget.event.eventTitle,
                  textScaleFactor: 1.5,
                ),
                Text(
                  '${widget.event.startTime.day} ${DateFormat.MMM().format(widget.event.startTime)}',
                  textScaleFactor: 1.5,
                )
              ],
            ),
            const SizedBox(height: 2),
            Text('by ${widget.event.uid}'),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 15.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Text('${event.location[0]} , ${event.location[1]}'),
              ],
            ),
            const SizedBox(height: 10),
            JoinedBy(
              friends: widget.joinedByList,
              isOwnEvent: widget.poster == 'you',
            )
          ],
        ),
      ),
    );
  }
}
