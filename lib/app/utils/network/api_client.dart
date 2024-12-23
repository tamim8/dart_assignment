import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ecommerce_getx/app/data/model/api_response.dart';
import 'package:ecommerce_getx/app/utils/secure_storage/secure_storage.dart';

import '../constants/api_constants.dart';
import '../logger/app_logger.dart';
import 'api_base.dart';
import 'app_exceptions.dart';

class ApiClient extends ApiBase {
  final SecureStorage _storage = SecureStorage();

  ///-- Prepare headers for requests
  Future<Map<String, String>> get _headers async {
    final String token = await _storage.read(key: SSKey.token);
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token.isNotEmpty) {
      headers['token'] = token;
    }
    return headers;
  }

  ///-- Build URI with optional query parameters
  Uri _buildUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return uri;
  }

  ///-- Generic GET Method --------------------------------
  @override
  Future<T> getApi<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      // Log the response Url and Query Params
      log(LogLevel.info, 'Url: $uri\nQuery Params:\n $queryParams');

      final response = await http
          .get(uri, headers: await _headers)
          .timeout(ApiConstants.connectionTimeout);

      // Log the response status and body
      log(LogLevel.info,
          'Status Code: ${response.statusCode}\nResponses:\n ${response.body}');

      return fromJson(await _handleResponse(response));
    } on SocketException {
      log(LogLevel.error, 'No internet connection');
      throw NoInternetException();
    } on TimeoutException {
      log(LogLevel.error, 'Request timeout');
      throw RequestTimeoutException();
    } on FormatException {
      log(LogLevel.error, 'Request timeout');
      throw FormatException();
    } catch (e) {
      log(LogLevel.error, 'Unexpected error: $e');
      rethrow;
    }
  }

  ///-- Generic GET Method --------------------------------
  @override
  Future<T> postApi<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      // Log the response Url and Query Params
      log(LogLevel.info, 'Url: $uri\nQuery Params:\n $queryParams');

      final response = await http
          .post(uri, body: jsonEncode(body), headers: await _headers)
          .timeout(ApiConstants.connectionTimeout);

      // Log the response status and body
      log(LogLevel.info,
          'Status Code: ${response.statusCode}\nResponses:\n ${response.body}');

      return fromJson(await _handleResponse(response));
    } on SocketException {
      log(LogLevel.error, 'No internet connection');
      throw NoInternetException();
    } on TimeoutException {
      log(LogLevel.error, 'Request timeout');
      throw RequestTimeoutException();
    } catch (e) {
      log(LogLevel.error, 'Unexpected error: $e');
      rethrow;
    }
  }

  ///-- Method to handle HTTP responses
  dynamic _handleResponse(http.Response response) async {
    final ApiResponse apiResponse =
        ApiResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (apiResponse.status == 'success') {
        if (apiResponse.token != null && apiResponse.token != '') {
          await _storage.write(key: SSKey.token, value: apiResponse.token!);
        }
        return apiResponse.data;
      }
      throw FetchDataException(
          message: '${apiResponse.status}\n${apiResponse.data.toString()}');
    }

    final String message = apiResponse.data.toString();
    final String? status = apiResponse.status;
    throw FetchDataException(
        message: '$status\n$message', code: response.statusCode);
  }
}
