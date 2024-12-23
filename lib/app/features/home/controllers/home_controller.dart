import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/secure_storage/secure_storage.dart';
import '../../auth/data/models/user_model.dart';

class HomeController extends GetxController {
  final SecureStorage _storage = SecureStorage();

  RxInt selectedIndex = 0.obs;
  Rx<UserModel> user = UserModel().obs;

  void setIndex(int index) => selectedIndex(index);

  @override
  void onInit() async {
    await loadUserFromLocalStorage();
    super.onInit();
  }
  @override
  @override
  void onReady() {
    super.onReady();

    loadUserFromLocalStorage();
  }


  Future<void> loadUserFromLocalStorage() async {
    try {
      final String userJson = await _storage.read(key: SSKey.userModel);

      if (userJson.isNotEmpty) {
        user.value = UserModel.fromJson(jsonDecode(userJson));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
