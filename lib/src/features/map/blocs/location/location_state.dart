part of 'location_bloc.dart';

class LocationState {
  LocationState({this.lastKnownLocation});

  final LatLng? lastKnownLocation;

  LocationState copyWith({
    final LatLng? lastKnownLocation,
  }) {
    return LocationState(
      lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
    );
  }
}
