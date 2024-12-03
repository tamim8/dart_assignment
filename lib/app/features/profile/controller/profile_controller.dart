import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/models/user_model.dart';
import 'package:task_manager/app/features/profile/data/repository/profile_repository.dart';

import '../../../utils/secure_storage/secure_storage.dart';

class ProfileController extends GetxController {
  final SecureStorage _storage = SecureStorage();
  ProfileRepository profileRepo;

  ProfileController(this.profileRepo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<TextEditingController> emailTEController = TextEditingController().obs;
  Rx<TextEditingController> firstNameTEController = TextEditingController().obs;
  Rx<TextEditingController> lastNameTEController = TextEditingController().obs;
  Rx<TextEditingController> mobileNoTEController = TextEditingController().obs;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    loadProfileDetails();
    super.onInit();
  }

  Future<void> loadProfileDetails() async {
    errorMessage('');
    try {
      String userString = await _storage.read(key: SSKey.userModel);

      UserModel user = UserModel.fromJson(jsonDecode(userString));

      emailTEController.value = TextEditingController(text: user.email);
      firstNameTEController.value = TextEditingController(text: user.firstName);
      lastNameTEController.value = TextEditingController(text: user.lastName);
      mobileNoTEController.value = TextEditingController(text: user.mobile);
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<void> updateProfileInfo() async {
    if (formKey.currentState!.validate()) {
      errorMessage('');
      isLoading(true);

      Map<String, String> body = {
        'email': emailTEController.value.text.trim(),
        'firstName': firstNameTEController.value.text.trim(),
        'lastName': lastNameTEController.value.text.trim(),
        'mobile': mobileNoTEController.value.text.trim(),
      };

      try {
        await profileRepo.updateProfile(body);
      } catch (error) {
        errorMessage(error.toString());
      } finally {
        isLoading(false);
      }
    }
  }
}
