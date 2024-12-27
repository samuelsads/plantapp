import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_text_size.dart';

const TextStyle _btnText = TextStyle(
  fontWeight: FontWeight.w600,
);

/// Extension used to get the text theme
extension AppTextExtension on TextTheme {
  /// Method used to get the text theme
  TextStyle get btnText => _btnText.copyWith(
        fontSize: bodySmallSize,
      );
}
