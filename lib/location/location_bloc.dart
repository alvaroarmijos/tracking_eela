import 'dart:async';

import 'package:bloc/bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
  }

  FutureOr<void> _onInitialLocationEvent(
    InitialLocationEvent event,
    Emitter<LocationState> emit,
  ) {
    // Logica para obtener la ubicacion inicial del usuario
  }
}
