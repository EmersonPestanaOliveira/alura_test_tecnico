import 'package:technical_project/core/imports_core.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductController _productController;
  UnmodifiableListView<Product> _allProducts = UnmodifiableListView([]);
  int _itemsToShow = 3;

  ProductCubit(this._productController) : super(ProductState.initial()); // Estado inicial

  /// Método para buscar todos os produtos e preencher a lista completa e a filtrada
  /// Método para buscar todos os produtos e preencher a lista completa e a filtrada
  Future<void> fetchProducts() async {
    // Emite o estado com isLoading: true quando o carregamento começa
    emit(state.copyWith(isLoading: true));
    try {
      final products = await _productController.getProducts();
      _allProducts = UnmodifiableListView(products);
      // Após carregar os produtos, emite o estado ProductLoaded
      emit(ProductLoaded(
        allProducts: products,
        products: products.take(_itemsToShow).toList(),
        itemsToShow: _itemsToShow,
      ));
    } catch (e) {
      // Emite o estado de erro se o carregamento falhar
      emit(ProductError(errorMessage: 'Unexpected error occurred'));
    }
  }

  /// Método para aumentar a quantidade de produtos a serem exibidos
  void increaseItemsToShow() {
    if (_itemsToShow < _allProducts.length) {
      _itemsToShow += 3;
      emit(ProductLoaded(
        products: _allProducts.take(_itemsToShow).toList(),
        allProducts: _allProducts,
        itemsToShow: _itemsToShow,
      ));
    }
  }

  /// Método para verificar se todos os itens foram exibidos
  bool allItemsDisplayed() {
    return _itemsToShow >= _allProducts.length;
  }

  /// Método para filtrar produtos com base na busca
  void filterProducts(String query) {
    final filteredProducts = query.isEmpty
        ? _allProducts
        : _productController.filterProductsByName(_allProducts, query);
    emit(ProductLoaded(
      products: filteredProducts.take(_itemsToShow).toList(),
      allProducts: _allProducts,
      itemsToShow: _itemsToShow,
    ));
  }

  /// Método para filtrar produtos por ID
  void filterProductsById(int id) {
    filterProductsByNameAndId(id: id);
  }

  /// Método para filtrar produtos por nome e ID
  void filterProductsByNameAndId({String? nameQuery, int? id}) {
    final filteredProducts = _productController.filterProducts(
      _allProducts,
      nameQuery: nameQuery,
      categoryId: id,
    );
    emit(ProductLoaded(
      products: filteredProducts.take(_itemsToShow).toList(),
      allProducts: _allProducts,
      itemsToShow: _itemsToShow,
    ));
  }
}
