import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState());

  GoogleMapController? _mapController;

  void onMapInitialized(GoogleMapController controller) {
    _mapController = controller;
    // Version antigua de cambiar el estilo del mapa.
    // controller.setMapStyle(jsonEncode(mapStyle));
  }

  void moveCamera(LatLng position) {
    final cameraUpdate = CameraUpdate.newLatLng(position);
    _mapController?.moveCamera(cameraUpdate);
  }

  void addUserPolyline(List<LatLng> points) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        points: points,
        color: Colors.purple,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        patterns: [
          PatternItem.dot,
          PatternItem.gap(8),
        ]);

    // {
    // 'myRoute': Polyline1,
    // 'directions': Polyline2,
    // }

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    // {
    // 'myRoute': NewPolyline1,
    // 'directions': Polyline2,
    // }

    emit(
      state.copyWith(
        polylines: currentPolylines,
      ),
    );
  }

  void toggleShowPolyline() {
    emit(
      state.copyWith(isPolylineShown: !state.isPolylineShown),
    );
  }
}
