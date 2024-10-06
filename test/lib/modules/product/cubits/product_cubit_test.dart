import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/modules/product/cubits/product_cubit.dart';
import 'package:technical_project/modules/product/cubits/product_state.dart';
import 'package:technical_project/modules/product/models/product_model.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../../mocks/mocks.mocks.dart'; // Importe o MockProduct corretamente

void main() {
  late ProductCubit productCubit;
  late MockProductController mockProductController;

  setUp(() {
    // Inicializando o mock do controller
    mockProductController = MockProductController();
    productCubit = ProductCubit(mockProductController);
  });

  tearDown(() {
    productCubit.close();
  });

  group('ProductCubit Tests', () {
    // Simulando a resposta de sucesso do backend
    final productsList = [
      const Product(id: 1, categoriaId: 1, name: 'Camiseta Básica', price: 29.99, imagePath: 'https://picsum.photos/312/292?random=4'),
      const Product(id: 2, categoriaId: 1, name: 'Calça Jeans', price: 79.99, imagePath: 'https://picsum.photos/312/292?random=5'),
    ];

    blocTest<ProductCubit, ProductState>(
      'emits [ProductState.initial(), ProductState with isLoading: true, ProductLoaded] when products are fetched successfully',
      build: () {
        // Mockando a resposta de sucesso do serviço de produto
        when(mockProductController.getProducts())
            .thenAnswer((_) async => productsList);

        return productCubit;
      },
      act: (cubit) => cubit.fetchProducts(),
      expect: () => [
        ProductState(products: const [], allProducts: const [], isLoading: true, errorMessage: null, itemsToShow: 3), // Estado com isLoading: true
        ProductLoaded(
          products: productsList,
          allProducts: productsList,
          itemsToShow: 3,
        ),
      ],
    );

    blocTest<ProductCubit, ProductState>(
      'emits [ProductState.initial(), ProductState with isLoading: true, ProductError] when fetching products fails',
      build: () {
        // Mockando a resposta de falha do serviço de produto
        when(mockProductController.getProducts()).thenThrow(Exception('Failed to fetch products'));

        return productCubit;
      },
      act: (cubit) => cubit.fetchProducts(),
      expect: () => [
        ProductState(products: const [], allProducts: const [], isLoading: true, errorMessage: null, itemsToShow: 3), // Estado com isLoading: true
        ProductError(errorMessage: 'Unexpected error occurred'),
      ],
    );
  });
}
