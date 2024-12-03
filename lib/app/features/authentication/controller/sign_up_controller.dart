import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';


class SignUpController extends GetxController {
  AuthRepository authRepo;

  SignUpController(this.authRepo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileNoTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  bool isLoading = false;
  String errorMessage = '';

  Future<bool> signUp() async {
    if (formKey.currentState!.validate()) {
      errorMessage = '';
      isLoading = true;
      update();

      Map<String, String> body = {
        'email': emailTEController.text.trim(),
        'firstName': firstNameTEController.text.trim(),
        'lastName': lastNameTEController.text.trim(),
        'mobile': mobileNoTEController.text.trim(),
        'password': passwordTEController.text,
      };
      try {
        await authRepo.registration(body);

        return true;
      } catch (error) {
        errorMessage = error.toString();
      } finally {
        isLoading = false;
        update();
      }
    }
    return false;
  }
}
