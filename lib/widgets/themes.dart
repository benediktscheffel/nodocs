import 'package:flutter/material.dart';

class Themes {
  static final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF111122),
      onPrimary: Colors.white,
      onPrimaryContainer: Color(0xFF0353A4),
      secondary: Color(0xFF061A40),
      onSecondary: Colors.white,
      tertiary: Color(0xFF006DAA),
      onTertiary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFF111122),
      onSurface: Colors.white,
      tertiaryContainer: Colors.white,
      onTertiaryContainer: Colors.black,
      tertiaryFixed: Color(0xFFECE7E7),
      onTertiaryFixed: Color(0xFFCAC4D0),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Color(0x4C2196F3),
      selectionHandleColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      height: 32,
      minWidth: 64,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
      ),
    ),
    useMaterial3: true,
  );

  static final ThemeData light = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFB9D6F2),
      onPrimary: Colors.black,
      onPrimaryContainer: Color(0xFF0353A4),
      secondary: Color(0xFF0353A4),
      onSecondary: Colors.white,
      tertiary: Colors.white,
      onTertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFFB9D6F2),
      onSurface: Colors.black,
      tertiaryContainer: Colors.white,
      onTertiaryContainer: Colors.black,
      tertiaryFixed: Color(0xFFECE7E7),
      onTertiaryFixed: Color(0xFFCAC4D0),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Color(0x4C2196F3),
      selectionHandleColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      height: 32,
      minWidth: 64,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
      ),
    ),
    useMaterial3: true,
  );
}
