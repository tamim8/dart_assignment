import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';
import 'package:task_manager/app/utils/helper/functions.dart';

class ForgetPasswordController extends GetxController {
  AuthRepository authRepo;

  ForgetPasswordController(this.authRepo);

  final TextEditingController emailTEController = TextEditingController();

  bool isLoading = false;
  bool isValidEmail = false;
  String errorMessage = '';

  void onChangeEmail(String email) {
    isValidEmail = email.isValidEmail;
    update();
  }

  Future<bool> emailVerify() async {
    errorMessage = '';
    isLoading = true;
    update();

    try {
      await authRepo.emailVerification(emailTEController.text.trim());
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
