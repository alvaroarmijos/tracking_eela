import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/search/search_cubit.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});
  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        SafeArea(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                context.read<SearchCubit>().updateShowManualMarker(false);
              },
              icon: Icon(
                Icons.navigate_before,
                color: colorPrimary,
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: Icon(
              Icons.location_on_rounded,
              size: 48,
              color: colorPrimary,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 32,
            ),
            child: ElevatedButton(
              onPressed: () {
                final locationBloc = context.read<LocationBloc>();
                final start = locationBloc.state.lastKnownLocation;

                final mapCubit = context.read<MapCubit>();
                final end = mapCubit.mapCenter;

                if (start == null || end == null) return;
                context.read<SearchCubit>().getRoute(start, end);
              },
              child: const Text('Confirmar'),
            ),
          ),
        )
      ],
    );
  }
}
