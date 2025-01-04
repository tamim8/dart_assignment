import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';
import 'custom/custom_theme.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      inputDecorationTheme: CustomInputDecorationTheme.light,
      elevatedButtonTheme: CustomElevatedButtonTheme.light,
      textButtonTheme: CustomTextButtonTheme.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),
    );
  }
}
