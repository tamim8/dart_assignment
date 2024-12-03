abstract class AuthRepository {
  Future<void> tokenValidation();
  Future<void> login(Map<String, dynamic> body);
  Future<void> registration(Map<String, dynamic> body);
  Future<void> emailVerification(String email);
  Future<void> verifyOtp(String email, String otp);
  Future<void> resetPassword(Map<String, dynamic> body);
}
