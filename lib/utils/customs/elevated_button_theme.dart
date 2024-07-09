import 'package:flutter/material.dart';

class TaiyoElevatedButtonTheme {
  TaiyoElevatedButtonTheme._();

  // Light Elevated Button Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color: Colors.lightBlue),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
  );
  // Dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color: Colors.lightBlue),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
  );
}
