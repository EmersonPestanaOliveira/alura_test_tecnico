import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/modules/product/cubits/product_state.dart';
import 'package:technical_project/modules/product/models/product_model.dart';

void main() {
  group('ProductState Tests', () {
    const product1 = Product(
      id: 1,
      categoriaId: 1,
      name: 'Camiseta Básica',
      price: 29.99,
      imagePath: 'https://picsum.photos/312/292?random=4',
    );

    const product2 = Product(
      id: 2,
      categoriaId: 1,
      name: 'Calça Jeans',
      price: 79.99,
      imagePath: 'https://picsum.photos/312/292?random=5',
    );

    final List<Product> productsList = [product1, product2];

    test('Initial state should have default values', () {
      final state = ProductState.initial();

      expect(state.products, []);
      expect(state.allProducts, []);
      expect(state.isLoading, false);
      expect(state.errorMessage, null);
      expect(state.itemsToShow, 3);
    });

    test('copyWith should return a new state with updated values', () {
      final initialState = ProductState.initial();

      final newState = initialState.copyWith(
        products: productsList,
        allProducts: productsList,
        isLoading: true,
        errorMessage: 'Error occurred',
        itemsToShow: 5,
      );

      expect(newState.products, productsList);
      expect(newState.allProducts, productsList);
      expect(newState.isLoading, true);
      expect(newState.errorMessage, 'Error occurred');
      expect(newState.itemsToShow, 5);
    });

    test('copyWith should return the same state if no new values are provided', () {
      final initialState = ProductState.initial();

      final newState = initialState.copyWith();

      expect(newState.products, initialState.products);
      expect(newState.allProducts, initialState.allProducts);
      expect(newState.isLoading, initialState.isLoading);
      expect(newState.errorMessage, initialState.errorMessage);
      expect(newState.itemsToShow, initialState.itemsToShow);
    });

    test('hasError should return true if errorMessage is set', () {
      final stateWithError = ProductState.initial().copyWith(
        errorMessage: 'An error occurred',
      );

      expect(stateWithError.hasError, true);
    });

    test('hasError should return false if errorMessage is null or empty', () {
      final stateWithoutError = ProductState.initial();
      final stateWithEmptyError = ProductState.initial().copyWith(
        errorMessage: '',
      );

      expect(stateWithoutError.hasError, false);
      expect(stateWithEmptyError.hasError, false);
    });

    test('props should contain the expected properties', () {
      final state = ProductState(
        products: productsList,
        allProducts: productsList,
        isLoading: false,
        errorMessage: null,
        itemsToShow: 3,
      );

      expect(
        state.props,
        [productsList, productsList, false, null, 3],
      );
    });
  });
}
