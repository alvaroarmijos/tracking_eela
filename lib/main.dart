import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/pages/loading_page.dart';
import 'package:tracking_eela/src/core/ui/app_theme.dart';
import 'package:tracking_eela/src/features/gps/bloc/gps_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/cubit/map_cubit.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/search/search_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: MaterialApp(
        title: 'Material App',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GpsBloc()
                ..add(GpsInitialStatusEvent())
                ..add(ChangeGpsStatusEvent()),
            ),
            BlocProvider(
              create: (context) => LocationBloc()
                ..add(
                  InitialLocationEvent(),
                )
                ..add(StartTrackingUserEvent()),
            ),
            BlocProvider(
              create: (context) => MapCubit(),
            ),
          ],
          child: const LoadingPage(),
        ),
        theme: AppTheme.light,
      ),
    );
  }
}
