abstract class ProfileRepository {
  Future<void> fetchProfileDetails();
  Future<void> updateProfile(Map<String, dynamic> body);
}
