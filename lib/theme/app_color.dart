import 'package:flutter/material.dart';

class AppColors {
  // Primary Branding Colors
  static const Color primary = Color(0xFF30094C);
  static const Color primaryDark = Color(0xFF1E0130); // Custom darker shade
  static const Color primaryLight = Color(0xFF5E2C7E); // Optional
  static const Color accent = Color(0xFF47C599); // Vibrant green

  // Text Colors
  static const Color textDark = Color(0xFF222222);
  static const Color textLight = Color(0xFFEEEEEE);

  // Secondary & Tertiary
  static const Color secondary = Color(0xFF5E239E);
  static const Color tertiary = Color(0xFF83E4C4);

  // Light Theme Neutrals
  static const Color background = Color(0xFFF5F5F7);
  static const Color surface = Colors.white;
  static const Color text = Color(0xFF1A1A1A);

  // Dark Theme Neutrals
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Colors.white;

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient accentGradient = LinearGradient(
    colors: [accent, tertiary],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  // Aliases (optional for clarity)
  static const Color votixPurple = primary;
  static const Color votixGreen = accent;
  static const Color lightBackground = Color(0xFFF8F7FC);
}
