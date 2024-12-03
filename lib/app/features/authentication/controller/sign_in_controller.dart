import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';
import 'package:task_manager/app/utils/helper/functions.dart';

import '../../../utils/secure_storage/secure_storage.dart';

class SignInController extends GetxController {
  final SecureStorage _storage = SecureStorage();
  AuthRepository authRepo;

  SignInController(this.authRepo);

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  bool isLoading = false;
  bool buttonActive = false;
  String errorMessage = '';

  @override
  void onReady() async {
    try {
      String email = await _storage.read(key: SSKey.email);
      String password = await _storage.read(key: SSKey.password);

      emailTEController = TextEditingController(text: email);
      passwordTEController = TextEditingController(text: password);

      if (email.isNotEmpty && password.isNotEmpty) {
        buttonActive = true;
        update();
      }

    } finally {
      isLoading = false;
      update();
    }
    super.onReady();
  }

  onChangedEmailOrPassword(String value) {
    if (passwordTEController.text.isNotEmpty &&
        emailTEController.text.isValidEmail) {
      buttonActive = true;
      update();
    } else {
      buttonActive = false;
      update();
    }
  }

  Future<bool> signIn() async {
    errorMessage = '';
    isLoading = true;
    update();

    Map<String, String> body = {
      'email': emailTEController.text.trim(),
      'password': passwordTEController.text,
    };
    try {
      await _storage.clearAll();
      await authRepo.login(body);
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
