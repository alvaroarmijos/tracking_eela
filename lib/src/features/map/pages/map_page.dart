import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              final lastKownLocation = state.lastKnownLocation;

              if (lastKownLocation == null) {
                return const Center(
                  child: Text('Espere por favor...'),
                );
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: lastKownLocation,
                  zoom: 17,
                ),
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: (controller) {
                  mapCubit.onMapInitialized(controller);
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
            child: const Icon(Icons.more_horiz),
          ),
          FloatingActionButton.small(
            onPressed: () {
              final lastKnownLocation =
                  context.read<LocationBloc>().state.lastKnownLocation;

              if (lastKnownLocation == null) return;

              mapCubit.moveCamera(lastKnownLocation);
            },
            child: const Icon(
              Icons.gps_fixed,
            ),
          ),
        ],
      ),
    );
  }
}
