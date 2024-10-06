import 'package:technical_project/core/imports_core.dart';

class ProductService {
  final ApiService _apiService;

  ProductService(this._apiService);

  static const String _productsUrl = APIConstants.productsUrl;

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _apiService.get(_productsUrl);

      if (response.statusCode == 200 && response.data != null) {
        return _decodeProductData(response.data);
      } else {
        throw Exception('${ApiErrorsMenssage.errorLoadingProducts}${response.statusCode}');
      }
    } catch (e) {
      throw Exception('${ApiErrorsMenssage.errorFetchingProducts}$e');
    }
  }

  List<Product> _decodeProductData(dynamic data) {
    Map<String, dynamic>? jsonData;
    
    if (data is Map<String, dynamic>) {
      jsonData = data;
    } else if (data is String) {
      try {
        jsonData = jsonDecode(data) as Map<String, dynamic>?;
      } catch (e) {
        throw Exception('${ApiErrorsMenssage.errorDecodingJson}$e');
      }
    } else {
      throw Exception('${ApiErrorsMenssage.errorUnexpectedDataFormat}${data.runtimeType}');
    }

    final produtosData = jsonData?['produtos'] as List<dynamic>?;

    if (produtosData != null && produtosData.isNotEmpty) {
      return Product.fromJsonList(produtosData);
    } else {
      throw Exception(ApiErrorsMenssage.errorEmptyOrNullProductList);
    }
  }
}
