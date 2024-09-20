import 'package:crud_app/app/features/product/model/product_model.dart';

class ApiResponse {
  final String status;
  final List<Product> data;

  ApiResponse({
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );
}
