import 'package:flutter/material.dart';

const brandPurple = Color(0xFF4C33EB);
const ink = Color(0xFF19162D);
const mutedInk = Color(0xFF6D6A7C);
const pageBackground = Color(0xFFF7F7FB);
const softPurple = Color(0xFFF0EEFF);
const successGreen = Color(0xFF16875B);

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: brandPurple,
    primary: brandPurple,
    surface: Colors.white,
    error: const Color(0xFFCC394B),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: pageBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: pageBackground,
      foregroundColor: ink,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: ink,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: ink,
        fontSize: 28,
        height: 1.15,
        fontWeight: FontWeight.w800,
      ),
      headlineSmall: TextStyle(
        color: ink,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        color: ink,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(color: ink, fontSize: 14, height: 1.45),
      bodySmall: TextStyle(color: mutedInk, fontSize: 12, height: 1.4),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE7E5EF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE7E5EF)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
