import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.orange,
      onPrimary: Colors.black,
      secondary: AppColours.purple,
      onSecondary: AppColours.darkShade,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.white,
      onBackground: AppColours.darkShade,
      surface: Colors.white,
      onSurface: AppColours.darkShade,
    ),
  );
}
