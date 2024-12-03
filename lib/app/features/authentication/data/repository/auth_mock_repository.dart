import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';

class AuthMockRepository implements AuthRepository {
  @override
  Future<void> login(Map<String,dynamic> body) async {
    // TODO: implement login

      throw UnimplementedError('AuthMockRepository');

  }

  @override
  Future<void> emailVerification(String email) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<void> verifyOtp(String email, String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(Map<String, dynamic> body) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> registration(Map<String, dynamic> body) {
    // TODO: implement registration
    throw UnimplementedError();
  }

  @override
  Future<bool> tokenValidation() {
    // TODO: implement tokenValidation
    throw UnimplementedError();
  }


}
