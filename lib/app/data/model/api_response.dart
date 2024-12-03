class ApiResponse {
  final String? status;
  final String? message;
  final String? token;
  final dynamic data;

  ApiResponse({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  // Factory constructor to create an ApiResponse object from a JSON map
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      data: json['data'],
    );
  }
}
