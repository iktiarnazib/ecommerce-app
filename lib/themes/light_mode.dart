import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
);

final themeProvider = StateProvider<ThemeData>((ref) {
  return lightMode;
});
