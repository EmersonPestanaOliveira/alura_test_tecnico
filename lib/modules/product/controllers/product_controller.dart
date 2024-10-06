import 'package:technical_project/core/imports_core.dart';

class ProductController {
  final ProductService _productService;

  ProductController(this._productService);

  /// Recupera a lista de produtos do serviço.
  Future<List<Product>> getProducts() async {
    try {
      return await _productService.fetchProducts();
    } catch (e) {
      rethrow;
    }
  }

  /// Filtra produtos pelo nome.
  List<Product> filterProductsByName(List<Product> products, String query) {
    return filterProducts(products, nameQuery: query);
  }

  /// Filtra produtos pela categoria.
  List<Product> filterProductsByCategory(List<Product> products, int id) {
    return filterProducts(products, categoryId: id);
  }

  /// Filtra produtos pelo nome e/ou categoria.
  List<Product> filterProducts(List<Product> products, {String? nameQuery, int? categoryId}) {
    final formattedNameQuery = nameQuery?.trim().toLowerCase();

    return products.where((product) {
      final productName = product.name.trim().toLowerCase();
      final matchByName = (formattedNameQuery == null || formattedNameQuery.isEmpty) ||
          productName.startsWith(formattedNameQuery);
      final matchByCategory = (categoryId == null) || product.categoriaId == categoryId;
      return matchByName && matchByCategory;
    }).toList()
      ..sort((a, b) => a.name.trim().toLowerCase().compareTo(b.name.trim().toLowerCase()));
  }
}
