import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/search/search_cubit.dart';
import 'package:tracking_eela/src/features/map/pages/manual_marker_page.dart';
import 'package:tracking_eela/src/features/map/widgets/widgets.dart';

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
              // if (state.lastKnownLocation != null) {
              //   mapCubit.moveCamera(state.lastKnownLocation!);
              // }
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
              return Stack(
                children: [
                  MapSection(lastKownLocation: lastKownLocation),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return state.showManualMarker
                          ? const ManualMarker()
                          : const SearchBarInfo();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: const FloatingActionsMap(),
    );
  }
}
