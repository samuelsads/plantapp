import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:plant_app/core/theme/app_text_size.dart';

/// Class used to view dark theme
class DarkTheme {
  final ColorScheme _colorExtension = ThemeData().colorScheme;

  /// Method used to get the dark theme
  ThemeData theme() => ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _colorExtension.whiteDark,
      ),
      scaffoldBackgroundColor: _colorExtension.blackDark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: _colorExtension.whiteDark),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _colorExtension.blackDark,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: _colorExtension.blackDark,
      ),
      switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(_colorExtension.whiteDark),
          trackColor: WidgetStateProperty.all(_colorExtension.grayDark)),
      colorScheme: ColorScheme.dark(
        surface: _colorExtension.blackDark,
        onSurface: _colorExtension.whiteDark,
        secondary: _colorExtension.whiteDark,
        primaryContainer: _colorExtension.darkGreyDark,
      ),
      dividerTheme: DividerThemeData(color: _colorExtension.whiteDark),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: _colorExtension.whiteDark,
              fontSize: largeSize,
              fontWeight: FontWeight.w500),
          headlineMedium: TextStyle(
              color: _colorExtension.whiteDark, fontSize: largeMediumSize),
          headlineSmall: TextStyle(color: _colorExtension.whiteDark),
          bodyLarge: TextStyle(
            color: _colorExtension.white,
            fontSize: bodyLargeSize,
          ),
          bodyMedium: TextStyle(
            color: _colorExtension.whiteDark,
            fontSize: bodyMediumSize,
          ),
          labelLarge: TextStyle(
            color: _colorExtension.whiteDark,
            fontSize: largeMediumSize,
          ),
          labelMedium: TextStyle(
              color: _colorExtension.whiteDark, fontSize: largeMediumSize)),
      iconTheme: IconThemeData(color: _colorExtension.whiteDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(_colorExtension.blueDark))));
}
