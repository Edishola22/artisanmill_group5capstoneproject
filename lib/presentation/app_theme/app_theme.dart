import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme textTheme = TextTheme(
    titleLarge: GoogleFonts.dmSans(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColours.darkShade,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColours.darkShade,
    ),
    bodyMedium: GoogleFonts.dmSans(
      color: AppColours.darkShade,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.dmSans(
      color: AppColours.darkShade,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ));

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    textTheme: textTheme,
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
