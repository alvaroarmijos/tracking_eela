import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData.from(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF5063D1),
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5063D1),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(44)),
      ),
    );
  }
}
