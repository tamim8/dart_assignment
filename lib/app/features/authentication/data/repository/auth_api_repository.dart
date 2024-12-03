import 'dart:convert';

import 'package:task_manager/app/features/authentication/data/models/user_model.dart';
import 'package:task_manager/app/utils/constants/api_constants.dart';
import 'package:task_manager/app/utils/secure_storage/secure_storage.dart';

import '../../../../utils/network/api_client.dart';
import 'auth_repository.dart';

class AuthApiRepository extends ApiClient implements AuthRepository {
  final SecureStorage _storage = SecureStorage();

  @override
  Future<void> tokenValidation() async {
    await getApi(
      endpoint: ApiConstants.profileDetails,
      fromJson: (json) => (json as List).map((j) => UserModel.fromJson(j)),
    );
  }

  @override
  Future<void> login(Map<String, dynamic> body) async {
    try {

      // Perform the login API request and await the result
      final user = await postApi<UserModel>(
        endpoint: ApiConstants.login,
        body: body,
        fromJson: (json) => UserModel.fromJson(json),
      );

      // Store the user model
      _storage.write(key: SSKey.userModel, value: jsonEncode(user.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> emailVerification(String email) async {
    try {
      await getApi(
          endpoint: '${ApiConstants.verifyRecoveryEmail}/$email',
          fromJson: (json) {});

      await _storage.write(key: SSKey.email, value: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    try {
      await getApi(
        endpoint: '${ApiConstants.verifyOtp}/$email/$otp',
        fromJson: (json) {},
      );

      await _storage.write(key: SSKey.otp, value: otp);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(Map<String, dynamic> body) async {
    try {
      await postApi(
        endpoint: ApiConstants.resetPassword,
        body: body,
        fromJson: (json) {},
      );

      await _storage.write(key: SSKey.password, value: body['password']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registration(Map<String, dynamic> body) async {
    try {
      UserModel user = await postApi(
        endpoint: ApiConstants.registration,
        body: body,
        fromJson: (json) => UserModel.fromJson(json),
      );

      await _storage.write(key: SSKey.email, value: user.email!);
      await _storage.write(key: SSKey.password, value: user.password!);
    } catch (e) {
      rethrow;
    }
  }
}
