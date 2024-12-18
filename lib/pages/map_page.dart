import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                -3.994800,
                -79.202797,
              ),
              zoom: 17,
            ),
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
        ),
      ),
    );
  }
}
