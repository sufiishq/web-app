import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    cardColor: const Color(0xFF121313),
    primaryColor: const Color(0xFF383838),
    canvasColor: const Color(0xFF2C2C2C),
    indicatorColor: const Color(0xFFEEEEEE),
    errorColor: const Color(0xFFE2425F),
  );
  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    cardColor: const Color(0xFFEFF2F3),
    primaryColor: const Color(0xFFE7E7E7),
    canvasColor: const Color(0xFF2C2C2C),
    indicatorColor: const Color(0xFFEEEEEE),
    errorColor: const Color(0xFFE2425F),
  );
}
