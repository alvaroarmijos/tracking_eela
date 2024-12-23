part of 'map_cubit.dart';

class MapState {
  MapState({
    this.polylines = const {},
    this.isPolylineShown = true,
  });

  final Map<String, Polyline> polylines;
  final bool isPolylineShown;

  MapState copyWith({
    final Map<String, Polyline>? polylines,
    final bool? isPolylineShown,
  }) {
    return MapState(
      polylines: polylines ?? this.polylines,
      isPolylineShown: isPolylineShown ?? this.isPolylineShown,
    );
  }
}
