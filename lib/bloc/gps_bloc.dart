import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(GpsState()) {
    // StreamSubscription<ServiceStatus>? serviceStatusStream;
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);
    on<AskLocationPermissionsEvent>(_onAskLocationPermissionsEvent);
  }

  // @override
  // Future<void> close() {
  //   serviceStatusStream?.dispose();
  //   return super.close();
  // }

  FutureOr<void> _onGpsInitialStatusEvent(
    GpsInitialStatusEvent event,
    Emitter<GpsState> emit,
  ) async {
    final isGpsEnabled = await Geolocator.isLocationServiceEnabled();
    final isLocationPermissionGranted = await ph.Permission.location.isGranted;

    emit(state.copyWith(
      isGpsEnabled: isGpsEnabled,
      isLocationPermissionsGranted: isLocationPermissionGranted,
    ));
  }

  FutureOr<void> _onChangeGpsStatusEvent(
    ChangeGpsStatusEvent event,
    Emitter<GpsState> emit,
  ) {
    //  serviceStatusStream =
    //     Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
    //   final isGpsEnabled = status == ServiceStatus.enabled;
    //   return emit(isGpsEnabled);
    // });
    return emit.forEach(
      Geolocator.getServiceStatusStream(),
      onData: (status) {
        final isGpsEnabled = status == ServiceStatus.enabled;
        return state.copyWith(
          isGpsEnabled: isGpsEnabled,
        );
      },
    );
  }

  FutureOr<void> _onAskLocationPermissionsEvent(
    AskLocationPermissionsEvent event,
    Emitter<GpsState> emit,
  ) async {
    final status = await ph.Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      // Abrir las configuraciones de la app para que el usuario manualmente
      // nos de permisos
      ph.openAppSettings();
      return;
    }

    return emit(state.copyWith(isLocationPermissionsGranted: true));
  }
}
