import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/bloc/gps_bloc.dart';
import 'package:tracking_eela/pages/map_page.dart';
import 'package:tracking_eela/widgets/enable_gps.dart';
import 'package:tracking_eela/widgets/permissions_gps.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        if (state.isLocationPermissionsGranted) {
          return const MapPage();
        }
        return Scaffold(
          body: BlocBuilder<GpsBloc, GpsState>(
            builder: (context, state) {
              if (state.isGpsEnabled) {
                return const PermissionsGps();
              }
              return const EnableGps();
            },
          ),
        );
      },
    );
  }
}
