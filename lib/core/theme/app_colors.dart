import 'package:flutter/material.dart';

/// Color palette for the plant app
/// Defines the main and secondary colors for the user interface.
class AppColors {
  /// Main green used for highlights
  static const MaterialColor green = MaterialColor(
    0xFF4CAF50, // Base color
    <int, Color>{
      50: Color(0xFFE8F5E9), // Very light green
      100: Color(0xFFC8E6C9), // Light green
      200: Color(0xFFA5D6A7), // Soft green
      300: Color(0xFF81C784), // Medium green
      400: Color(0xFF66BB6A), // Vibrant green
      500: Color(0xFF4CAF50), // Main green
      600: Color(0xFF43A047), // Slightly darker green
      700: Color(0xFF388E3C), // Dark green
      800: Color(0xFF2E7D32), // Deeper green
      900: Color(0xFF1B5E20), // Very dark green
    },
  );

  /// Beige for neutral backgrounds
  static const Color beige = Color(0xFFF5F5DC);

  /// Brown for earthy details and tones
  static const Color brown = Color(0xFF8D6E63);

  /// Soft yellow for accents and interactive elements
  static const Color yellow = Color(0xFFFFF176);

  /// White for clean elements and contrast
  static const Color white = Colors.white;

  /// Black for text and contrasting elements
  static const Color black = Colors.black;

  /// Dark green used in the dark theme
  static const Color darkGreen = Color(0xFF1B5E20);

  /// Neutral dark gray for darker backgrounds
  static const Color darkGray = Color(0xFF2C2C2C);

  /// Dark brown for earthy tones in the dark theme
  static const Color brownDark = Color(0xFF5D4037);
}

/// Extension to easily access the colors defined in AppColors
extension AppColorsExtension on ColorScheme {
  /// Main green
  Color get green => AppColors.green;

  /// Neutral beige
  Color get beige => AppColors.beige;

  /// Light brown
  Color get brown => AppColors.brown;

  /// Yellow for accents
  Color get yellow => AppColors.yellow;

  /// White
  Color get white => AppColors.white;

  /// Black
  Color get black => AppColors.black;

  /// Dark green for dark themes
  Color get darkGreen => AppColors.darkGreen;

  /// Dark gray for neutral backgrounds
  Color get darkGray => AppColors.darkGray;

  /// Dark brown for darker details
  Color get brownDark => AppColors.brownDark;
}
