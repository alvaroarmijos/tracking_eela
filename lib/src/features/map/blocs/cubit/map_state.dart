part of 'map_cubit.dart';

class MapState {
  MapState({
    this.polylines = const {},
    this.markers = const {},
    this.isPolylineShown = true,
  });

  final Map<String, Polyline> polylines;
  final bool isPolylineShown;
  final Map<String, Marker> markers;

  MapState copyWith({
    final Map<String, Polyline>? polylines,
    final bool? isPolylineShown,
    final Map<String, Marker>? markers,
  }) {
    return MapState(
      polylines: polylines ?? this.polylines,
      isPolylineShown: isPolylineShown ?? this.isPolylineShown,
      markers: markers ?? this.markers,
    );
  }
}
