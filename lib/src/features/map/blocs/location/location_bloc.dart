import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
    on<StartTrackingUserEvent>(_onStartTrackingUserEvent);
  }

  FutureOr<void> _onInitialLocationEvent(
    InitialLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    // Logica para obtener la ubicacion inicial del usuario
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,
      ),
    );

    final lastKnownLocation = LatLng(position.latitude, position.longitude);

    return emit(state.copyWith(lastKnownLocation: lastKnownLocation));
  }

  FutureOr<void> _onStartTrackingUserEvent(
    StartTrackingUserEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.forEach(
      Geolocator.getPositionStream(),
      onData: (position) {
        final lastKnownLocation = LatLng(position.latitude, position.longitude);
        return state.copyWith(lastKnownLocation: lastKnownLocation);
      },
    );
  }
}
