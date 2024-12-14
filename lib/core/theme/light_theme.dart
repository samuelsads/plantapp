import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:plant_app/core/theme/app_text_size.dart';

//// Class used to view light theme
class LightTheme {
  final ColorScheme _colorExtension = ThemeData().colorScheme;

  /// Method used to get the light theme
  ThemeData theme() => ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _colorExtension.white,
      ),
      scaffoldBackgroundColor: _colorExtension.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: _colorExtension.black),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _colorExtension.white,
      ),
      switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(_colorExtension.white),
          trackColor: WidgetStateProperty.all(_colorExtension.gray)),
      colorScheme: ColorScheme.dark(
          surface: _colorExtension.white,
          onSurface: _colorExtension.black,
          secondary: _colorExtension.white,
          primaryContainer: _colorExtension.whiteDark),
      dividerTheme: DividerThemeData(color: _colorExtension.black),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: _colorExtension.black,
              fontSize: largeSize,
              fontWeight: FontWeight.w500),
          headlineMedium: TextStyle(
              color: _colorExtension.black, fontSize: largeMediumSize),
          headlineSmall: TextStyle(color: _colorExtension.black),
          bodyLarge:
              TextStyle(color: _colorExtension.black, fontSize: bodyLargeSize),
          bodyMedium:
              TextStyle(color: _colorExtension.black, fontSize: bodyMediumSize),
          labelLarge: TextStyle(
            color: _colorExtension.white,
            fontSize: largeMediumSize,
            fontFamily: 'Roboto',
          ),
          labelMedium: TextStyle(
              color: _colorExtension.black, fontSize: largeMediumSize)),
      iconTheme: IconThemeData(color: _colorExtension.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(_colorExtension.blue))));
}
