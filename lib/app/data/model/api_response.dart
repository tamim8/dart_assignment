class ApiResponse<T> {
  final String status;
  final String? message;
  final String? token;
  final T? data;

  ApiResponse({
    required this.status,
    this.message,
    this.token,
    this.data,
  });

  // Factory constructor to create an ApiResponse object from a JSON map
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic)? fromJsonT) {
    return ApiResponse<T>(
      status: json['status'] as String,
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: json['data'] != null && fromJsonT != null ? fromJsonT(json['data']) : json['data'],
    );
  }

  // Convert an ApiResponse object to a JSON map
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'status': status,
      'message': message,
      'token': token,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}
