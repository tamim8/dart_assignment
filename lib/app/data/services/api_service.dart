import '../../features/product/model/product_model.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class ApiService {
  final HttpClient _http = HttpClient();

  /// -- Fetch Product List From Server
  Future<List<Product>> fetchProductList() async {
    final productResponse = await _http.makeGetRequest<List<Product>>(
      endpoint: ApiConstants.products,
      fromJsonT: (data) =>
          (data as List).map((e) => Product.fromJson(e)).toList(),
    );

    if (productResponse.status == 'success' && productResponse.data != null) {
      return productResponse.data!;
    }
    print('Error: ${productResponse.message}');
    return [];
  }

  /// -- Create a New Product
  Future<bool> createProduct({required jsonBody}) async {
    final productResponse = await _http.makePostRequest<Product>(
      endpoint: ApiConstants.createProduct,
      body: jsonBody,
      fromJsonT: (data) => Product.fromJson(data),
    );

    if (productResponse.status == 'success' && productResponse.data != null) {
      return true;
    }
    print('Error: ${productResponse.message}');
    return false;
  }

  /// -- Update Existing Product
  Future<bool> updateProduct({required jsonBody, required id}) async {
    final productResponse = await _http.makePostRequest<Product>(
      endpoint: '${ApiConstants.updateProduct}/$id',
      body: jsonBody,
      fromJsonT: (data) => Product.fromJson(data),
    );

    if (productResponse.status == 'success' && productResponse.data != null) {
      return true;
    }

    print('Error: ${productResponse.message}');

    return false;
  }

  /// -- Delete Product
  Future<bool> deleteProduct({required String id}) async {
    final deleteResponse = await _http.makeGetRequest<Product>(
      endpoint: '${ApiConstants.deleteProduct}/$id',
      fromJsonT: (data) => Product.fromJson(data),
    );

    if (deleteResponse.status == 'success' && deleteResponse.data != null) {
      return true;
    }
    print('Error: ${deleteResponse.message}');
    return false;
  }

  // ///-- Check Product image is exist in this url or not
  // Future<bool> isValidProductImageUrl({required String url}) async {
  //   return await _http.checkImageUrl(url);
  // }
}
