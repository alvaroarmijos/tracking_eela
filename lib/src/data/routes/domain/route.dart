import 'package:google_maps_flutter/google_maps_flutter.dart';

class Route {
  final double? duration;
  final double? distance;
  final List<LatLng> points;

  Route({
    required this.duration,
    required this.distance,
    required this.points,
  });
}
