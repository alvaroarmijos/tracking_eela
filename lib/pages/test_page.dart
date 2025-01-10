import 'package:flutter/material.dart';
import 'package:tracking_eela/src/core/widgets/start_uber_marker.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 150,
          color: Colors.red,
          child: CustomPaint(
            painter: StartUberMarker(
              time: '12',
              place: 'Supermaxi',
            ),
          ),
        ),
      ),
    );
  }
}
