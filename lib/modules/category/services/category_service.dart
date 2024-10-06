import 'package:technical_project/core/imports_core.dart';

class CategoryService {
  final ApiService _apiService;

  CategoryService(this._apiService);

  static const String _categoriesUrl = APIConstants.categoriesUrl;

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _apiService.get(_categoriesUrl);

      if (response.statusCode == 200 && response.data != null) {
        return _decodeCategoryData(response.data);
      } else {
        throw Exception('${ApiErrorsMenssage.errorLoadingCategories}${response.statusCode}');
      }
    } catch (e) {
      throw Exception('${ApiErrorsMenssage.errorFetchingProducts}$e');
    }
  }

  List<Category> _decodeCategoryData(dynamic data) {
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

    final categoriasData = jsonData?['categorias'] as List<dynamic>?;

    if (categoriasData != null && categoriasData.isNotEmpty) {
      return Category.fromJsonList(categoriasData);
    } else {
      throw Exception(ApiErrorsMenssage.errorEmptyOrNullProductList);
    }
  }
}
