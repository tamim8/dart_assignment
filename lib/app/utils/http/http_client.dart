import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../../data/model/api_response.dart';
import '../constants/api_constants.dart';

class HttpClient {
  // Prepare headers for requests
  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  // Build URI with optional query parameters
  Uri _buildUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return uri;
  }

  ///-- Check for internet connectivity
  Future<bool> _isConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    return connectivityResult != ConnectivityResult.none;
  }

  ///-- Private method to handle all HTTP responses
  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic) fromJsonT,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return ApiResponse<T>.fromJson(jsonResponse, fromJsonT);
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
    required T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  }) async {
    if (await _isConnected()) {
      try {
        final uri = _buildUri(endpoint, queryParams: queryParams);
        final response = await http.get(uri, headers: _getHeaders());
        return _handleResponse(response, fromJsonT);
      } catch (e) {
        return ApiResponse<T>(status: "error", message: "Exception: $e");
      }
    } else {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    }
  }

  ///-- Generic POST Method --------------------------------
  Future<ApiResponse<T>> makePostRequest<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    required T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  }) async {
    if (await _isConnected()) {
      try {
        final uri = _buildUri(endpoint, queryParams: queryParams);
        final response = await http.post(
          uri,
          headers: _getHeaders(),
          body: jsonEncode(body),
        );

        return _handleResponse(response, fromJsonT);
      } catch (e) {
        return ApiResponse<T>(status: "error", message: "Exception: $e");
      }
    } else {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    }
  }

  ///-- Generic PUT method with internet connectivity check
  Future<ApiResponse<T>> put<T>(
    String endpoint,
    Map<String, dynamic> body,
    T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  ) async {
    if (await _isConnected()) {
      try {
        final uri = _buildUri(endpoint, queryParams: queryParams);
        final response = await http.post(
          uri,
          headers: _getHeaders(),
          body: jsonEncode(body),
        );
        return _handleResponse(response, fromJsonT);
      } catch (e) {
        return ApiResponse<T>(status: "error", message: "Exception: $e");
      }
    } else {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    }
  }

  ///-- Generic DELETE method with internet connectivity check
  Future<ApiResponse<T>> delete<T>(
    String endpoint,
    T Function(dynamic) fromJsonT,
    Map<String, dynamic>? queryParams,
  ) async {
    if (await _isConnected()) {
      try {
        final uri = _buildUri(endpoint, queryParams: queryParams);
        final response = await http.post(
          uri,
          headers: _getHeaders(),
        );
        return _handleResponse(response, fromJsonT);
      } catch (e) {
        return ApiResponse<T>(status: "error", message: "Exception: $e");
      }
    } else {
      return ApiResponse<T>(status: "error", message: "No internet connection");
    }
  }

// ///-- Check if image exists at the given URL
// Future<bool> checkImageUrl(String url) async {
//   try {
//     final response = await http.get(Uri.parse(url));
//     return response.statusCode == 200;
//   } catch (e) {
//     return false;
//   }
// }
}
