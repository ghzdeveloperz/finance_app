import 'package:flutter/material.dart';

import 'tokens/app_colors.dart';
import 'tokens/app_radius.dart';
import 'tokens/app_typography.dart';

class AppThemeDark {
  const AppThemeDark._();

  static ThemeData get value {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.neutral0,
      secondary: AppColors.neutral200,
      surface: AppColors.surfaceDark,
      error: AppColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: colorScheme,
      textTheme: const TextTheme(
        displaySmall: AppTypography.displaySmall,
        headlineMedium: AppTypography.headlineMedium,
        titleLarge: AppTypography.titleLarge,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        labelLarge: AppTypography.labelLarge,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
      ),
    );
  }
}