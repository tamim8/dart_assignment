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
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ));
  }

  static InputDecorationTheme get inputDecorationTheme {
    return const InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.white),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
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
}
