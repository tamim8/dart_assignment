import 'package:crud_app/app/data/model/delete_response.dart';

import '../../features/product/model/product_model.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';
import '../model/api_response.dart';

class ApiService {
  final HttpClient _http = HttpClient();

  /// -- Fetch Product List From Server
  Future<List<Product>> fetchProductList() async {
    final apiResponse = await _http.makeGetRequest<ApiResponse>(
      endpoint: ApiConstants.products,
      fromJson: (jsonResponse) => ApiResponse.fromJson(jsonResponse),
    );
    return apiResponse.data;
  }

  /// -- Create a New Product
  Future<bool> createProduct({required jsonBody}) async {
    return await _http.makePostRequest(endpoint: ApiConstants.createProduct, body: jsonBody);
  }

  /// -- Update Existing Product
  Future<bool> updateProduct({required jsonBody, required id}) async {
    return await _http.makePostRequest(endpoint: '${ApiConstants.updateProduct}/$id', body: jsonBody);
  }

  /// -- Delete Product
  Future<bool> deleteProduct({required String productId}) async {
    final DeleteResponse deleteResponse = await _http.makeGetRequest<DeleteResponse>(
      endpoint: '${ApiConstants.deleteProduct}/$productId',
      fromJson: (jsonResponse) => DeleteResponse.fromJson(jsonResponse),
    );
    return deleteResponse.status == 'success';
  }

  ///-- Check Product image is exist in this url or not
  Future<bool> isValidProductImageUrl({required String url}) async {
    return await _http.checkImageUrl(url);
  }
}
