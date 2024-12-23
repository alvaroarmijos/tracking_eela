import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/core/ui/map_style.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';
import 'package:tracking_eela/src/features/map/widgets/floating_actions_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: BlocConsumer<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state.lastKnownLocation != null) {
                mapCubit.moveCamera(state.lastKnownLocation!);
              }
              if (state.myLocationHistory.isNotEmpty) {
                mapCubit.addUserPolyline(state.myLocationHistory);
              }
            },
            builder: (context, state) {
              final lastKownLocation = state.lastKnownLocation;

              if (lastKownLocation == null) {
                return const Center(
                  child: Text('Espere por favor...'),
                );
              }
              return BlocBuilder<MapCubit, MapState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: lastKownLocation,
                      zoom: 17,
                    ),
                    style: jsonEncode(mapStyle),
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) {
                      mapCubit.onMapInitialized(controller);
                    },
                    // circles: {
                    //   Circle(
                    //     // fillColor: Colors.red,
                    //     circleId: const CircleId('value'),
                    //     center: lastKownLocation,
                    //     radius: 20,
                    //     strokeWidth: 5,
                    //     strokeColor: Colors.red,
                    //   ),
                    // },
                    // polygons: {
                    //   const Polygon(
                    //     polygonId: PolygonId('value-polygon'),
                    //     points: [
                    //       LatLng(37.3426, -121.9471),
                    //       LatLng(37.3429, -121.9457),
                    //       LatLng(37.3419, -121.9454),
                    //       LatLng(37.3417, -121.9469),
                    //     ],
                    //     fillColor: Colors.green,
                    //     strokeColor: Colors.blue,
                    //     strokeWidth: 5,
                    //   )
                    // },
                    // polylines: {
                    //   Polyline(
                    //     polylineId: const PolylineId('polyline'),
                    //     points: state.myLocationHistory,
                    //     color: Colors.purple,
                    //     width: 5,
                    //   ),
                    // },
                    polylines: state.isPolylineShown
                        ? state.polylines.values.toSet()
                        : {},
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: const FloatingActionsMap(),
    );
  }
}
