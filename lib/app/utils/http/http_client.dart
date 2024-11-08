import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../data/model/api_response.dart';
import '../constants/api_constants.dart';

abstract class HttpClient {
  late final GetStorage _storage;

  HttpClient() {
    _storage = GetStorage();
  }

  GetStorage get localStorage => _storage;

  // Prepare headers for requests
  Map<String, String> _getHeaders() {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (_storage.read('token') != null) {
      headers['token'] = _storage.read('token');
    }
    return headers;
  }

  // Build URI with optional query parameters
  Uri _buildUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return uri;
  }

  ///-- Private method to handle all HTTP responses
  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic)? fromJsonT,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final ApiResponse<T> result =
          ApiResponse<T>.fromJson(jsonResponse, fromJsonT);
      if (result.status == 'success') {
        return result;
      }
      return ApiResponse<T>(
        status: result.status,
        message: "Fail: ${result.data}",
      );
    } else {
      return ApiResponse<T>(
        status: "error",
        message: "Error: ${response.statusCode} - ${response.body}",
      );
    }
  }

  ///-- Generic GET Method --------------------------------
  Future<ApiResponse<T>> makeGetRequest<T>({
    required String endpoint,
    T Function(dynamic)? fromJsonT,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      final response = await http.get(
        uri,
        headers: _getHeaders(),
      );
      return _handleResponse(response, fromJsonT);
    } on SocketException {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    } catch (e) {
      return ApiResponse<T>(status: "error", message: "Exception: $e");
    }
  }

  ///-- Generic POST Method --------------------------------
  Future<ApiResponse<T>> makePostRequest<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    T Function(dynamic)? fromJsonT,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      final response = await http.post(
        uri,
        headers: _getHeaders(),
        body: jsonEncode(body),
      );
      return _handleResponse(response, fromJsonT);
    } on SocketException {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    } catch (e) {
      return ApiResponse<T>(status: "error", message: "Exception: $e");
    }
  }

  ///-- Generic PUT method with internet connectivity check
  Future<ApiResponse<T>> makePutRequest<T>(
    String endpoint,
    Map<String, dynamic> body,
    T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      final response = await http.post(
        uri,
        headers: _getHeaders(),
        body: jsonEncode(body),
      );
      return _handleResponse(response, fromJsonT);
    } on SocketException {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    } catch (e) {
      return ApiResponse<T>(status: "error", message: "Exception: $e");
    }
  }

  ///-- Generic DELETE method with internet connectivity check
  Future<ApiResponse<T>> makeDeleteRequest<T>(
    String endpoint,
    T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final uri = _buildUri(endpoint, queryParams: queryParams);
      final response = await http.post(
        uri,
        headers: _getHeaders(),
      );
      return _handleResponse(response, fromJsonT);
    } on SocketException {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    } catch (e) {
      return ApiResponse<T>(status: "error", message: "Exception: $e");
    }
  }
}
