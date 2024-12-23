part of 'location_bloc.dart';

class LocationState {
  LocationState({
    this.lastKnownLocation,
    this.myLocationHistory = const [],
  });

  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  LocationState copyWith({
    final LatLng? lastKnownLocation,
    final List<LatLng>? myLocationHistory,
  }) {
    return LocationState(
      lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
      myLocationHistory: myLocationHistory ?? this.myLocationHistory,
    );
  }
}
