part of 'gps_bloc.dart';

class GpsState {
  GpsState({
    this.isGpsEnabled = false,
    this.isLocationPermissionsGranted = false,
  });

  final bool isGpsEnabled;
  final bool isLocationPermissionsGranted;

  /// Returns whether is all enable with the gps and Permissions
  bool get isAllEnable => isGpsEnabled && isLocationPermissionsGranted;

  // copyWith

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isLocationPermissionsGranted,
  }) {
    return GpsState(
      // isGpsEnabled: isGpsEnable1 != null ? isGpsEnabled1! : this.isGpsEnabled,
      isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
      isLocationPermissionsGranted:
          isLocationPermissionsGranted ?? this.isLocationPermissionsGranted,
    );
  }
}
