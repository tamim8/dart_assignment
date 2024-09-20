import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class HttpClient {
  ///-- this is Generic Get Method --------------------------------
  Future<T> makeGetRequest<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    // Prepare headers, including Content-Type for JSON
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Set the Content-Type to JSON
    };

    // Perform the GET request
    final Response response = await http.get(uri, headers: headers);

    // Parse the response
    return fromJson(_handleResponse(response));
  }

  ///-- this is Generic Post Method --------------------------------
  Future<bool> makePostRequest({
    required String endpoint,
    required Map<String, dynamic> body, // Added JSON body parameter
    Map<String, dynamic>? queryParams,
    String? token,
  }) async {
    // Build the URI with query parameters if any
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    // Prepare headers, including Content-Type for JSON
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Set the Content-Type to JSON
    };

    // Perform the POST request with the JSON-encoded body
    final Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body), // Encode the body to JSON
    );

    // Error handling for unsuccessful requests
    if (response.statusCode >= 400) {
      throw Exception('Failed to POST: ${response.statusCode}');
    }

    // Parse the response
    return _handleResponse(response) != null;
  }

  ///-- this is Generic Delete Method --------------------------------
  Future<bool> makeDeleteRequest({
    required String endpoint, // Added JSON body parameter
    Map<String, dynamic>? queryParams,
  }) async {
    // Build the URI with query parameters if any
    Uri uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    // Prepare headers, including Content-Type for JSON
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Set the Content-Type to JSON
    };

    // Perform the POST request with the JSON-encoded body
    final Response response = await http.delete(uri, headers: headers);

    // Error handling for unsuccessful requests
    if (response.statusCode >= 400) {
      throw Exception('Failed to Delete: ${response.statusCode}');
    }

    // Parse the response
    return _handleResponse(response) != null;
  }

  ///-- Handle response
  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to lode data: ${response.statusCode}');
    }
  }

  ///-- Check image is exist in this url or not
  Future<bool> checkImageUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
