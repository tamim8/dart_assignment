

import 'profile_repository.dart';

class ProfileApiRepository implements ProfileRepository {

  @override
  Future<void> fetchProfileDetails() async {
    // try {
    //   ApiResponse apiResponse = await _client.getApi(
    //     endpoint: ApiConstants.profileDetails,
    //     fromJson: (json) => ApiResponse.fromJson(json, null),
    //   );
    //
    //   if (apiResponse.status == 'success') {
    //     // Handle successful login
    //    // await _storage.saveData(LocalStorageKey.otp, otp);
    //   } else {
    //     // Handle error message
    //     throw 'Error: ${apiResponse.message}';
    //   }
    // } catch (e) {
    //   rethrow;
    // }
  }

  @override
  Future<void> updateProfile(Map<String, dynamic> body) async {
    // try {
    //   ApiResponse<UserModel> apiResponse = await _client.postApi(
    //     endpoint: ApiConstants.profileUpdate,
    //     body: body,
    //     fromJson: (json) => ApiResponse<UserModel>.fromJson(json, (j) => UserModel.fromJson(j)),
    //   );
    //
    //   if (apiResponse.status == 'success') {
    //     // Handle successful login
    //   }
    // } catch (e) {
    //   rethrow;
    // }
  }
}
