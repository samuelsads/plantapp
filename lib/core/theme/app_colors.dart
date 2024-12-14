import 'package:flutter/material.dart';

///Main blue color
const MaterialColor _blueMaterial = MaterialColor(
  0xFF0086FF, // Main blue color (default shade)
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
// Main dark gray color
const _darkGray = Color(0xFF3C3C3C);
// Main gray color
const _gray = Color(0xFF939598);

///Main error color
const _error = Color(0xFFB3261E);

///Main white color
const _white = Colors.white;

///Main black color
const _black = Colors.black;

///Main success color
const _success = Color(0xFF43A047);

///Main info color
const _info = Color(0xFF0086FF);

///Main warning color
const _warning = Color(0xFFFFB900);

///Extension that include colors defined in the theme
extension ExtensionsTheme on ColorScheme {
  ///Theme colors

  ///Getter that have the main color Blue
  MaterialColor get blue => _blueMaterial;

  ///Getter that have the main color Dark Gray
  Color get darkGrey => _darkGray;

  /// Getter that have the main color Gray
  Color get gray => _gray;

  ///Getter that have the secondary color Error
  Color get error => _error;

  ///Getter that have the main color White
  Color get white => _white;

  ///Getter that have the main color Black
  Color get black => _black;

  ///Getter that have the secondary color Success
  Color get success => _success;

  ///Getter that have the secondary color Warning
  Color get info => _info;

  ///Getter that have the secondary color Warning
  Color get warning => _warning;
}

///Extension that include colors defined in the dark theme

const MaterialColor _blueMaterialDark = MaterialColor(
  0xFF005BB5, // Main blue color for dark theme (default shade)
  <int, Color>{
    50: Color(0xFF1B2838),
    100: Color(0xFF1E3A5F),
    200: Color(0xFF274A78),
    300: Color(0xFF2E5A92),
    400: Color(0xFF396BB1),
    500: Color(0xFF4479CF),
    600: Color(0xFF5289EC),
    700: Color(0xFF609AFF),
    800: Color(0xFF73AFFF),
    900: Color(0xFF85C4FF),
  },
);

///Extension that include colors defined in the dark theme
const _darkGrayDark = Color(0xFF2C2C2C);

///Extension that include colors defined in the dark theme
const _grayDark = Color(0xFF757575);

///Extension that include colors defined in the dark theme
const _errorDark = Color(0xFFCF6679);

///Extension that include colors defined in the dark theme
const _whiteDark = Color(0xFFE0E0E0);

///Extension that include colors defined in the dark theme
const _blackDark = Color(0xFF121212);

///Extension that include colors defined in the dark theme
const _successDark = Color(0xFF2E7D32);

///Extension that include colors defined in the dark theme
const _infoDark = Color(0xFF0069C0);

///Extension that include colors defined in the dark theme
const _warningDark = Color(0xFFFFA000);

////Extension that include colors defined in the dark theme
extension ExtensionsDarkTheme on ColorScheme {
  ///Theme colors for Dark Mode

  ///Getter that has the main color Blue for dark theme
  MaterialColor get blueDark => _blueMaterialDark;

  ///Getter that has the main color Dark Gray for dark theme
  Color get darkGreyDark => _darkGrayDark;

  ///Getter that has the main color Gray for dark theme
  Color get grayDark => _grayDark;

  ///Getter that has the secondary color Error for dark theme
  Color get errorDark => _errorDark;

  ///Getter that has the main color White for dark theme
  Color get whiteDark => _whiteDark;

  ///Getter that has the main color Black for dark theme
  Color get blackDark => _blackDark;

  ///Getter that has the secondary color Success for dark theme
  Color get successDark => _successDark;

  ///Getter that has the secondary color Info for dark theme
  Color get infoDark => _infoDark;

  ///Getter that has the secondary color Warning for dark theme
  Color get warningDark => _warningDark;
}
