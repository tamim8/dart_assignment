import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        iconButtonTheme: iconButtonThem,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary));

  }

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey.shade100,
      ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.primary,
      ),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade50),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1.5, color: AppColors.primary),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  static TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
    );
  }

  static PinTheme get defaultPinTheme {
    return PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static IconButtonThemeData get iconButtonThem {
   return IconButtonThemeData(

     style: IconButton.styleFrom(
       backgroundColor: AppColors.greyLight,
       foregroundColor: Colors.grey,
     ),
   );
  }
}
