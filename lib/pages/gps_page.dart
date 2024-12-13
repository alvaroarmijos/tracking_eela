import 'package:flutter/material.dart';
import 'package:tracking_eela/widgets/permissions_gps.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PermissionsGps(),
    );
  }
}
