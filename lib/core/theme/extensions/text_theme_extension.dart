import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get texts => Theme.of(this).textTheme;
}