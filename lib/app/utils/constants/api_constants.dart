abstract class ApiConstants {
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration connectionTimeout = Duration(seconds: 20);
  static const baseUrl = 'http://35.73.30.144:2005/api/v1';

  // Authorization
  static const login = '/Login';
  static const registration = '/Registration';
  static const verifyRecoveryEmail = '/RecoverVerifyEmail';
  static const verifyOtp = '/RecoverVerifyOtp';
  static const resetPassword = '/RecoverResetPassword';

  //Profile
  static const profileDetails = '/ProfileDetails';
  static const profileUpdate = '/ProfileUpdate';

  // Task
  static const taskList = '/listTaskByStatus';
  static const taskStatusCount = '/taskStatusCount';
  static const createTask = '/createTask';
  static const updateTaskStatus = '/updateTaskStatus';
  static const deleteTask = '/deleteTask';
}
