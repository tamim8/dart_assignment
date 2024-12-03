import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';

import '../../../utils/secure_storage/secure_storage.dart';

class ResetPasswordController extends GetxController {
  AuthRepository authRepo;

  final SecureStorage _storage = SecureStorage();

  ResetPasswordController(this.authRepo);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  bool isLoading = false;
  bool buttonActive = false;
  bool isValidEmail = false;
  String errorMessage = '';

  void onChangedConfirmPassword(String value) {
    if (value == passwordController.text) {
      buttonActive = true;
      update();
    }
  }

  Future<bool> setNewPassword() async {
    errorMessage = '';
    isLoading = true;
    update();

    try {
      final String userInputPassword = passwordController.text;
      String email = await _storage.read(key: SSKey.email);
      String otp = await _storage.read(key: SSKey.otp);

      final Map<String, String> body = {
        "email": email,
        "OTP": otp,
        "password": userInputPassword,
      };

      await authRepo.resetPassword(body);

      return true;
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      update();
    }
    return false;
  }
}
