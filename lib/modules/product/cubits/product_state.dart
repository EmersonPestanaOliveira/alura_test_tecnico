import 'package:technical_project/core/imports_core.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final List<Product> allProducts;
  final bool isLoading;
  final String? errorMessage;
  final int itemsToShow;

  ProductState({
    required List<Product> products,
    required List<Product> allProducts,
    required this.isLoading,
    this.errorMessage,
    required this.itemsToShow,
  })  : products = List.unmodifiable(products),
        allProducts = List.unmodifiable(allProducts);

  /// Estado inicial da aplicação
  factory ProductState.initial() {
    return ProductState(
      products: const [],
      allProducts: const [],
      isLoading: false,
      errorMessage: null,
      itemsToShow: 3,
    );
  }

  /// Método para copiar o estado e atualizar valores específicos
  ProductState copyWith({
    List<Product>? products,
    List<Product>? allProducts,
    bool? isLoading,
    String? errorMessage,
    int? itemsToShow,
  }) {
    return ProductState(
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      itemsToShow: itemsToShow ?? this.itemsToShow,
    );
  }

  /// Getter para verificar se há erro
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @override
  List<Object?> get props => [products, allProducts, isLoading, errorMessage, itemsToShow];
}

/// Estado de carregamento de produtos
class ProductLoading extends ProductState {
  ProductLoading()
      : super(
          products: const [],
          allProducts: const [],
          isLoading: true,
          errorMessage: null,
          itemsToShow: 0,
        );

  @override
  List<Object?> get props => [isLoading];
}

/// Estado quando os produtos foram carregados com sucesso
class ProductLoaded extends ProductState {
  ProductLoaded({
    required List<Product> products,
    required List<Product> allProducts,
    required int itemsToShow,
  }) : super(
          products: products,
          allProducts: allProducts,
          isLoading: false,
          errorMessage: null,
          itemsToShow: itemsToShow,
        );

  @override
  List<Object?> get props => [products, allProducts, itemsToShow];
}

/// Estado de erro ao carregar produtos
class ProductError extends ProductState {
  ProductError({
    required String errorMessage,
  }) : super(
          products: const [],
          allProducts: const [],
          isLoading: false,
          errorMessage: errorMessage,
          itemsToShow: 0,
        );

  @override
  List<Object?> get props => [errorMessage];
}
