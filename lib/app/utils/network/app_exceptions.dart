class AppException implements Exception {
  final String? message;
  final int? code;

  AppException({this.message, this.code});

  @override
  String toString() {
    return '$message ${code != null ? '(Code: $code)' : ''}';
    // return 'HttpException: $message ${code != null ? '(Code: $code)' : ''}';
  }
}

// This is the exception that is thrown when the user is not connected to the Internet
class NoInternetException extends AppException {
  NoInternetException({message})
      : super(message: message ?? 'There is no internet connection');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({message})
      : super(message: message ?? 'You are not allowed to access this');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException({message})
      : super(message: message ?? 'Request timeout');
}

class FormatException extends AppException {
  FormatException({message})
      : super(message: message ?? 'Invalid Format');
}

class FetchDataException extends AppException {
  FetchDataException({super.message, super.code});
}
