import '../../../profile/data/repository/profile_repository.dart';

class AuthMockRepository implements ProfileRepository {
  @override
  Future<void> fetchProfileDetails() {
    // TODO: implement fetchProfileDetails
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(Map<String, dynamic> body) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
