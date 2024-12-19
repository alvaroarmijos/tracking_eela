import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/gps/bloc/gps_bloc.dart';
import 'package:tracking_eela/src/features/gps/widgets/enable_gps.dart';
import 'package:tracking_eela/src/features/gps/widgets/permissions_gps.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
