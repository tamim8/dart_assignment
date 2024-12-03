import 'dart:convert';

import 'package:task_manager/app/features/authentication/data/models/user_model.dart';
import 'package:task_manager/app/utils/constants/api_constants.dart';

import '../../../../utils/network/api_client.dart';
import '../../../../utils/secure_storage/secure_storage.dart';
import 'profile_repository.dart';

class ProfileApiRepository extends ApiClient implements ProfileRepository {
  final SecureStorage _storage = SecureStorage();

  @override
  Future<void> updateProfile(Map<String, dynamic> body) async {
    try {
      await postApi(
        endpoint: ApiConstants.profileUpdate,
        body: body,
        fromJson: (_) {},
      );
      await fetchProfileDetails();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> fetchProfileDetails() async {
    try {
      List<UserModel> userModel = await getApi(
        endpoint: ApiConstants.profileDetails,
        fromJson: (json) =>
            (json as List).map((j) => UserModel.fromJson(j)).toList(),
      );

      // Store the user model
      _storage.write(
          key: SSKey.userModel, value: jsonEncode(userModel.first.toJson()));
    } catch (e) {
      rethrow;
    }
  }
}
