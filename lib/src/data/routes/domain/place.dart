import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String text;
  final String placeName;
  final LatLng center;

  Place({
    required this.text,
    required this.placeName,
    required this.center,
  });
}
