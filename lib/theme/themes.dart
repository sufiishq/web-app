import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      background: Color(0xFF2C2C2C),
      brightness: Brightness.light,
      error: Colors.white,
      onBackground: Color(0xFF2B2C2E),
      onError: Color(0xFFE2425F),
      onPrimary: Color(0xFF424242),
      onSecondary: Color(0xFFF4FFE5),
      primary: Color(0xFFE7E7E7),
      primaryContainer: Color(0xFFCACACA),
      secondary: Color(0xFF0F76C4),
      secondaryContainer: Color(0xFF005493),
      onSurface: Color(0xFF121313),
      surface: Color(0xFFEFF2F3),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 16.0, fontFamily: 'Ubuntu', fontWeight: FontWeight.w400),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      background: Color(0xFF2C2C2C),
      brightness: Brightness.dark,
      error: Colors.white,
      onBackground: Color(0xFFDDDDDD),
      onError: Color(0xFFE2425F),
      onPrimary: Color(0xFFEEEEEE),
      onSecondary: Color(0xFFF4FFE5),
      primary: Color(0xFF383838),
      primaryContainer: Color(0xFF444444),
      secondary: Color(0xFF0F76C4),
      secondaryContainer: Color(0xFF005493),
      onSurface: Color(0xFF121313),
      surface: Color(0xFF121313),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 16.0, fontFamily: 'Ubuntu', fontWeight: FontWeight.w400),
    ),
  );
}
