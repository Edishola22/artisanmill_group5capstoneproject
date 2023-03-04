import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension SnackbarExtension on BuildContext {
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: colors.error,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }
}


