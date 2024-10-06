import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoryCubit e o estado
import '../../../../mocks/mocks.mocks.dart'; // Importe o MockCategoryController corretamente

void main() {
  late CategoryCubit categoryCubit;
  late MockCategoryController mockCategoryController;

  setUp(() {
    // Inicializando o mock do controller
    mockCategoryController = MockCategoryController();
    categoryCubit = CategoryCubit(mockCategoryController);
  });

  tearDown(() {
    categoryCubit.close();
  });

  group('CategoryCubit Tests', () {
    // Simulando a resposta de sucesso do backend
    final categoriesList = [
      const Category(id: 1, name: 'roupas', imagePath: 'https://picsum.photos/321/253?random=1'),
      const Category(id: 2, name: 'decoração', imagePath: 'https://picsum.photos/321/253?random=2'),
    ];

    blocTest<CategoryCubit, CategoryState>(
      'emits [CategoryState with isLoading: true, CategoryState with categories loaded] when categories are fetched successfully',
      build: () {
        // Mockando a resposta de sucesso do serviço de categoria
        when(mockCategoryController.fetchCategories())
            .thenAnswer((_) async => categoriesList);

        return categoryCubit;
      },
      act: (cubit) => cubit.fetchCategories(),
      expect: () => [
        CategoryState(categories: const [], isLoading: true, errorMessage: null), // Estado com isLoading: true
        CategoryState(categories: categoriesList, isLoading: false, errorMessage: null), // Estado com as categorias carregadas
      ],
    );

   /*  blocTest<CategoryCubit, CategoryState>(
      'emits [CategoryState with isLoading: true, CategoryState with error] when fetching categories fails',
      build: () {
        // Mockando a resposta de falha do serviço de categoria
        when(mockCategoryController.fetchCategories()).thenThrow(Exception('Failed to fetch categories'));

        return categoryCubit;
      },
      act: (cubit) => cubit.fetchCategories(),
      expect: () => [
        CategoryState(categories: const [], isLoading: true, errorMessage: null), // Estado com isLoading: true
        CategoryState(
          categories: const [],
          isLoading: false,
          errorMessage: 'Erro ao carregar categorias: Exception: Failed to fetch categories', // Verificação direta
        ),
      ],
      verify: (_) {
        // Verificando se a mensagem de erro contém o texto esperado
        expect(
          categoryCubit.state.errorMessage,
          contains('Erro ao carregar categorias: Exception: Failed to fetch categories'),
        );
      },
    ); */
  });
}
