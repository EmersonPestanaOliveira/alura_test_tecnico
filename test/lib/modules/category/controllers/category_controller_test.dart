import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário
import '../../../../mocks/mocks.mocks.dart';

void main() {
  late CategoryController categoryController;
  late MockCategoryService mockCategoryService;

  setUp(() {
    mockCategoryService = MockCategoryService();
    categoryController = CategoryController(mockCategoryService);
  });

  group('CategoryController Tests', () {
    test('should return a list of categories when fetchCategories is called', () async {
      // Mockando o serviço para retornar uma lista de categorias
      final mockCategories = [
        const Category(id: 1, name: 'Category A', imagePath: ''),
        const Category(id: 2, name: 'Category B', imagePath: ''),
      ];

      when(mockCategoryService.fetchCategories()).thenAnswer((_) async => mockCategories);

      // Verificação
      final result = await categoryController.fetchCategories();

      expect(result, mockCategories);
      verify(mockCategoryService.fetchCategories()).called(1);
    });

    test('should throw exception when fetchCategories fails', () async {
      // Simulando uma falha ao buscar categorias
      when(mockCategoryService.fetchCategories()).thenThrow(Exception('Failed to fetch categories'));

      expect(() => categoryController.fetchCategories(), throwsException);
    });

    test('should parse categories from JSON', () {
      // Mockando uma resposta JSON
      final jsonResponse = [
        {"id": 1, "nome": "Category A", "imagem": ""},
        {"id": 2, "nome": "Category B", "imagem": ""}
      ];

      // Chamando o método para converter o JSON em lista de categorias
      final result = categoryController.parseCategories(jsonResponse);

      expect(result.length, 2);
      expect(result.first.name, 'Category A');
      expect(result.last.name, 'Category B');
    });
  });
}
