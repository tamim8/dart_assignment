import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';

import '../../../utils/secure_storage/secure_storage.dart';

class PinVerificationController extends GetxController {
  final SecureStorage _storage = SecureStorage();
  AuthRepository authRepo;

  PinVerificationController(this.authRepo);

  final TextEditingController pinController = TextEditingController();

  bool buttonActive = false;
  bool isValid = true;
  bool isLoading = false;
  String errorMessage = '';

  void onChangedPin(value) {
    buttonActive = value.length == 6 ? true : false;
    update();
  }

  Future<bool> verified() async {
    errorMessage = '';
    isLoading = true;
    update();

    try {
      final String email = await _storage.read(key: SSKey.email);
      final String otp = pinController.text.toString();
      await authRepo.verifyOtp(email, otp);

      return true;
    } catch (error) {
      isValid = false;
      errorMessage = error.toString();
      update();
    } finally {
      isLoading = false;
      update();
    }
    return false;
  }
}
