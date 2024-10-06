import 'package:technical_project/core/imports_core.dart';

class CategoryController {
  final CategoryService _categoryService;

  CategoryController(this._categoryService);

  /// Recupera a lista de categorias do serviço.
  Future<List<Category>> fetchCategories() async {
    try {
      return await _categoryService.fetchCategories();
    } catch (e) {
      rethrow;
    }
  }

  /// Converte a lista de categorias a partir do JSON.
  List<Category> parseCategories(dynamic response) {
    return Category.fromJsonList(response);
  }
}

