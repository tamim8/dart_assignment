import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static ElevatedButtonThemeData get light {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
