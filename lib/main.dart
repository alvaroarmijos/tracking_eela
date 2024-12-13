import 'package:flutter/material.dart';
import 'package:tracking_eela/pages/gps_page.dart';
import 'package:tracking_eela/ui/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const GpsPage(),
      theme: AppTheme.light,
    );
  }
}
