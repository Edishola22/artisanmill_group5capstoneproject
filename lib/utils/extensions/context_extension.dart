import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}