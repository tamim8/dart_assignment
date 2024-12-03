

import '../logger/app_logger.dart';

abstract class ApiBase with AppLogger{
  Future<T> getApi<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  });

  Future<T> postApi<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  });


  // handleResponse(http.Response response) {
  //   final ApiResponse apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     if (apiResponse.status == 'success') {
  //       return jsonEncode(apiResponse.data);
  //     }
  //     throw FetchDataException(message: '${apiResponse.status}\n${apiResponse.data.toString()}');
  //   }
  //
  //   final String message = apiResponse.data.toString();
  //   final String? status = apiResponse.status;
  //   throw FetchDataException(message: '$status\n$message', code: response.statusCode);
  //   //_handleHttpException(response);
  // }

  ///-- Private method to handle all HTTP Exception
  // _handleHttpException(http.Response response) {
  //   final int statusCode = response.statusCode;
  //   switch (statusCode) {
  //     case 400:
  //       throw FetchDataException(message: 'Bad request. Please try again.', code: statusCode);
  //     case 401:
  //       throw FetchDataException(message: 'Unauthorized access. Please check your credentials.', code: statusCode);
  //     case 403:
  //       throw FetchDataException(message: 'Forbidden access.', code: statusCode);
  //     case 404:
  //       throw FetchDataException(message: 'Resource not found. Please check the URL.', code: statusCode);
  //     case 500:
  //       throw FetchDataException(message: 'Internal server error. Please try again later.', code: statusCode);
  //     case 503:
  //       throw FetchDataException(message: 'Service unavailable. Please try again later.', code: statusCode);
  //     default:
  //       throw FetchDataException(message: 'Something went wrong. Please try again.', code: statusCode);
  //   }
  // }
}
