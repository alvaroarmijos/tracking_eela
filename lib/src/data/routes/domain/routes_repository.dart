import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/data/routes/domain/route.dart';

abstract class RoutesRepository {
  Future<Route?> getRouteStartToEnd(LatLng start, LatLng end);
}
