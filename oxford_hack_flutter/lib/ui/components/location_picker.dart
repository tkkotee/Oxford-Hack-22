import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:oxford_hack_flutter/providers/form_and_radio_menu_provider.dart';
import 'package:provider/provider.dart';

class Location {
  List<double> longLat;
  String userAdress;
  Location({required this.longLat, required this.userAdress});
}

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key, this.onChanged});

  final VoidCallback? onChanged;

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Future<Location?> _handlePressButton(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: 'AIzaSyBJyUVUFO1xsMDktN2RvfHqRnFs_G7u6Wk',
        mode: Mode.overlay,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: const InputDecoration(
          hintText: 'Search',
        ),
        overlayBorderRadius: BorderRadius.circular(5),
        components: [Component(Component.country, 'uk')]);
    if (p != null) {
      return displayPrediction(p);
    } else {
      return null;
    }
  }

  Future<Location> displayPrediction(Prediction p) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: 'AIzaSyBJyUVUFO1xsMDktN2RvfHqRnFs_G7u6Wk',
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    return Location(longLat: [
      detail.result.geometry!.location.lat,
      detail.result.geometry!.location.lat
    ], userAdress: detail.result.name);
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Consumer<FormRadioMenuSelector>(
      builder: (context, value, child) {
        return Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(Icons.location_on_outlined),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      Location? location = await _handlePressButton(context);
                      if (location != null) {
                        value.resetAddy(location.userAdress, location.longLat);
                      }
                    },
                    child: Text(value.userAddress ?? 'Where to...?',
                        textScaleFactor: 1.5,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
