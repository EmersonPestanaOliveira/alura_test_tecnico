import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário
import 'package:mockito/mockito.dart';

class MockProductCubit extends MockCubit<ProductState> implements ProductCubit {}

class MockCategoryCubit extends MockCubit<CategoryState> implements CategoryCubit {}

void main() {
  late MockProductCubit mockProductCubit;
  late MockCategoryCubit mockCategoryCubit;

  setUp(() {
    // Cria instâncias mock dos Cubits
    mockProductCubit = MockProductCubit();
    mockCategoryCubit = MockCategoryCubit();

    // Mock para getIt
    when(getIt<ProductCubit>()).thenReturn(mockProductCubit);
    when(getIt<CategoryCubit>()).thenReturn(mockCategoryCubit);
  });

  group('BlocProviders Tests', () {
    test('should return a list of BlocProvider with correct cubits', () {
      final providers = BlocProviders.getProviders();

      // Verifica se a lista de providers contém dois BlocProviders
      expect(providers.length, 2);

  
    });

    test('should call fetchProducts on ProductCubit', () {
      BlocProviders.getProviders();

      // Verifica se o fetchProducts foi chamado no ProductCubit
      verify(mockProductCubit.fetchProducts()).called(1);
    });

    test('should call fetchCategories on CategoryCubit', () {
      BlocProviders.getProviders();

      // Verifica se o fetchCategories foi chamado no CategoryCubit
      verify(mockCategoryCubit.fetchCategories()).called(1);
    });
  });
}
