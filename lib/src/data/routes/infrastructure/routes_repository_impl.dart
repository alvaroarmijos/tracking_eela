import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:tracking_eela/src/data/routes/domain/route.dart';
import 'package:tracking_eela/src/data/routes/domain/routes_repository.dart';
import 'package:tracking_eela/src/data/routes/infrastructure/directions.dart';

class RoutesRepositoryImpl extends RoutesRepository {
  final Dio _dioDirections = Dio();
  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  @override
  Future<Route?> getRouteStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_baseDirectionsUrl/walking/$coorsString';

    try {
      final response = await _dioDirections.get(
        url,
        queryParameters: {
          'alternatives': false,
          'continue_straight': true,
          'geometries': 'polyline6',
          'overview': 'simplified',
          'steps': false,
          'access_token':
              'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2s4OHlqajE1MDFldDNlbzd5ZGtodnQycSJ9.vMDYnNVuC5gG4g1l9nD75w'
        },
      );

      final data = Directions.fromJson(response.data);

      print(data.routes?.first.geometry);

      final listPoint = decodePolyline(data.routes?.first.geometry ?? '',
          accuracyExponent: 6);

      final points = listPoint
          .map((coors) => LatLng(coors[0].toDouble(), coors[1].toDouble()))
          .toList();

      final route = Route(
        duration: data.routes?.first.duration,
        distance: data.routes?.first.distance,
        points: points,
      );

      return route;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
