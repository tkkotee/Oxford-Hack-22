import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key, this.onChanged});

  final VoidCallback? onChanged;

  Future<void> _handlePressButton(BuildContext context) async {
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
      displayPrediction(p);
    } else {
      return;
    }
  }

  Future<List<double>> displayPrediction(Prediction p) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: 'AIzaSyBJyUVUFO1xsMDktN2RvfHqRnFs_G7u6Wk',
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    return [
      detail.result.geometry!.location.lat,
      detail.result.geometry!.location.lat
    ];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(10, 6, 0, 6),
  //     width: double.infinity,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: const [
  //         Icon(Icons.description_outlined),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.fromLTRB(21, 0, 10, 0),
  //             child: SizedBox.shrink(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.fromLTRB(10,0,0,0),
            child: Icon(Icons.location_on_outlined),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: GestureDetector(onTap: () => _handlePressButton(context),
              child: const Text('Where to...?',
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold)),),
            ),
          ),
        ],
      ),
    );
  }
}
