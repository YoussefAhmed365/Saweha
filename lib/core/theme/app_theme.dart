import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 1. تعريف الألوان الأساسية (التي اتفقنا عليها من لوحة El Paso)
  static const Color primaryGreen = Color(0xFF878540);
  static const Color pendingOrange = Color(0xFFFFB74D);
  static const Color dangerRed = Color(0xFFDD2D2D);
  static const Color dangerLightRed = Color(0xFFF8E9E9);

  // ألوان الوضع الفاتح (Light Mode)
  static const Color lightBackground = Color(0xFFF6F7EF);
  static const Color lightCardSurface = Color(0xFFE9ECD6);
  static const Color lightText = Color(0xFF1F1C10);

  // ألوان الوضع الداكن (Dark Mode) - تم استنتاجها لتناسب اللون الأساسي
  static const Color darkBackground = Color(0xFF161510);
  static const Color darkCardSurface = Color(0xFF26241C);
  static const Color darkText = Color(0xFFF6F7EF);

  // 2. الثيم الفاتح (Light Theme)
  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        brightness: Brightness.light,
        primary: primaryGreen,
        surface: lightBackground,
        tertiary: pendingOrange,
        onSurface: lightText,
      ),
      scaffoldBackgroundColor: lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        foregroundColor: lightText,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: lightCardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );

    // دمج خط Baloo Bhaijaan 2
    return base.copyWith(
      textTheme: GoogleFonts.balooBhaijaan2TextTheme(base.textTheme),
    );
  }

  // 3. الثيم الداكن (Dark Theme)
  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        brightness: Brightness.dark,
        primary: primaryGreen,
        surface: darkBackground,
        tertiary: pendingOrange,
        onSurface: darkText,
      ),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: darkText,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: darkCardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryGreen,
        foregroundColor: darkText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );

    // دمج خط Baloo Bhaijaan 2 للوضع الداكن وتعديل لون النص
    return base.copyWith(
      textTheme: GoogleFonts.balooBhaijaan2TextTheme(base.textTheme).apply(
        bodyColor: darkText,
        displayColor: darkText,
      ),
    );
  }
}