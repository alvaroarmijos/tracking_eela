import 'package:flutter/material.dart';

class EnableGps extends StatelessWidget {
  const EnableGps({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.gps_off,
            size: 48,
            color: Colors.purple,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Debes activar el GPS'),
        ],
      ),
    );
  }
}
