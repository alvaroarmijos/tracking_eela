import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/bloc/gps_bloc.dart';
import 'package:tracking_eela/pages/loading_page.dart';
import 'package:tracking_eela/ui/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => GpsBloc()
          ..add(GpsInitialStatusEvent())
          ..add(ChangeGpsStatusEvent()),
        child: const LoadingPage(),
      ),
      theme: AppTheme.light,
    );
  }
}
