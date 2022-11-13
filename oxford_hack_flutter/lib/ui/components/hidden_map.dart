import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HiddenMap extends StatefulWidget {
  const HiddenMap({super.key});

  @override
  State<HiddenMap> createState() => _HiddenMapState();
}

class _HiddenMapState extends State<HiddenMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Container(
          width: 1000,
          height: 1000,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Color.fromARGB(200, 158, 158, 158),
              BlendMode.difference,
            ),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              liteModeEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                liteModeEnabled: false,
                tiltGesturesEnabled: false,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
