import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();

  static TextButtonThemeData get light {
    return TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
    );
  }
}
