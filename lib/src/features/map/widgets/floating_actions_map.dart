import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';

class FloatingActionsMap extends StatelessWidget {
  const FloatingActionsMap({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: 'polyline',
          onPressed: () {
            mapCubit.toggleShowPolyline();
          },
          child: const Icon(Icons.more_horiz),
        ),
        FloatingActionButton.small(
          heroTag: 'location',
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
    );
  }
}
