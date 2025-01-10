import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/core/utils/custom_images_markers.dart';
import 'package:tracking_eela/src/core/utils/latlng_bounds.dart';
import 'package:tracking_eela/src/core/utils/widget_to_markers.dart';
import 'package:tracking_eela/src/data/routes/domain/route.dart' as data;

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState());

  GoogleMapController? _mapController;
  LatLng? mapCenter;

  void onMapInitialized(GoogleMapController controller) {
    _mapController = controller;
    // Version antigua de cambiar el estilo del mapa.
    // controller.setMapStyle(jsonEncode(mapStyle));
  }

  void moveCamera(LatLng position) {
    final cameraUpdate = CameraUpdate.newLatLng(position);
    _mapController?.moveCamera(cameraUpdate);
  }

  void centerCameraPoints(List<LatLng> points) {
    final bounds = getLatLngBounds(points);
    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 100),
    );
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

  void addRoutePolyline(data.Route route) async {
    final direction = Polyline(
      polylineId: const PolylineId('direction'),
      points: route.points,
      color: Colors.black,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );

    // {
    // 'myRoute': Polyline1,
    // 'directions': Polyline2,
    // }

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['direction'] = direction;

    // {
    // 'myRoute': NewPolyline1,
    // 'directions': Polyline2,
    // }

    // Markers

    String distanceKm = (((route.distance ?? 0) / 1000)).toStringAsFixed(2);
    int time = ((route.duration ?? 0) / 60).toInt();
    // Google map markers
    // final startMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: route.points.first,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'km $distanceKm',
    //   ),
    // );
    // final endMarker = Marker(
    //     markerId: const MarkerId('end'),
    //     position: route.points.last,
    //     infoWindow: InfoWindow(
    //       title: 'Punto final',
    //       snippet: 'Tiempo: $time minutos',
    //     ));

    final assetIcon = await getAssetsImageMarker();

    // // Assets Markers
    // final startAssetMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: route.points.first,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'km $distanceKm',
    //   ),
    //   icon: assetIcon,
    // );

    // final endAssetMarker = Marker(
    //   markerId: const MarkerId('end'),
    //   position: route.points.last,
    //   infoWindow: InfoWindow(
    //     title: 'Punto final',
    //     snippet: 'Tiempo: $time minutos',
    //   ),
    //   icon: assetIcon,
    // );

    final networkMarker = await getNetworkImageMarker();

    // Network Markers
    // final startNetworkMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: route.points.first,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'km $distanceKm',
    //   ),
    //   icon: networkMarker,
    // );

    final endNetworkMarker = Marker(
      markerId: const MarkerId('end'),
      position: route.points.last,
      infoWindow: InfoWindow(
        title: 'Punto final',
        snippet: 'Tiempo: $time minutos',
      ),
      icon: networkMarker,
    );

    // Start uber Marker
    final startUberIcon =
        await getStartUberMarker(time.toString(), 'Supermaxi');

    final startUberMarker = Marker(
      markerId: const MarkerId('start'),
      position: route.points.first,
      anchor: const Offset(0.1, 1),
      infoWindow: InfoWindow(
        title: 'Punto de inicio',
        snippet: 'km $distanceKm',
      ),
      icon: startUberIcon,
    );

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startUberMarker;
    currentMarkers['end'] = endNetworkMarker;

    centerCameraPoints(route.points);

    emit(
      state.copyWith(
        polylines: currentPolylines,
        markers: currentMarkers,
      ),
    );
  }

  void toggleShowPolyline() {
    emit(
      state.copyWith(isPolylineShown: !state.isPolylineShown),
    );
  }
}
