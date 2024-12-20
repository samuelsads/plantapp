import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';

//// Class used to view light theme
class LightTheme {
  final ColorScheme _colorExtension = ThemeData().colorScheme;

  /// Method used to get the light theme
  ThemeData theme() => ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: _colorExtension.white,
        ),
        scaffoldBackgroundColor: _colorExtension.beige,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: _colorExtension.green),
          titleTextStyle: TextStyle(
            color: _colorExtension.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: _colorExtension.white,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(_colorExtension.green),
          trackColor: WidgetStateProperty.all(_colorExtension.green),
        ),
        colorScheme: ColorScheme.light(
          surface: _colorExtension.white,
          onSurface: _colorExtension.black,
          primary: _colorExtension.green,
          secondary: _colorExtension.brown,
          error: _colorExtension.yellow,
        ),
        dividerTheme: DividerThemeData(color: _colorExtension.green),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: _colorExtension.green,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: _colorExtension.brown,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(color: _colorExtension.green),
          bodyLarge: TextStyle(
              color: _colorExtension.brown,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              color: _colorExtension.brown,
              fontSize: 14,
              fontWeight: FontWeight.w300),
          labelLarge: TextStyle(
            color: _colorExtension.white,
            fontSize: 14,
          ),
        ),
        iconTheme: IconThemeData(color: _colorExtension.green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(_colorExtension.green),
            foregroundColor:
                WidgetStateProperty.all<Color>(_colorExtension.white),
          ),
        ),
      );
}
