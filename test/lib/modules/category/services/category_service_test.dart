import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart';

import '../../../../mocks/mocks.mocks.dart'; // Importe o MockApiService corretamente
import '../../../../mocks/mock_category.dart'; // Importe o MockCategory corretamente

void main() {
  late CategoryService categoryService;
  late MockApiService mockApiService;
  late MockCategory mockCategory;

  setUp(() {
    mockApiService = MockApiService();
    categoryService = CategoryService(mockApiService);
    mockCategory = MockCategory();
  });

  group('CategoryService Tests', () {
    test('should fetch and return a list of categories when the API call is successful', () async {
      // Mockando a resposta da API com sucesso
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.categoriesUrl),
        statusCode: 200,
        data: jsonEncode(mockCategory.getCategoriesSuccess()), // Usando o mock de categoria
      );

      when(mockApiService.get(APIConstants.categoriesUrl)).thenAnswer((_) async => mockResponse);

      // Verificação
      final result = await categoryService.fetchCategories();

      expect(result.length, 3); // Verifica se o número de categorias está correto
      expect(result.first.name, 'roupas'); // Verifica a primeira categoria
      verify(mockApiService.get(APIConstants.categoriesUrl)).called(1);
    });

    test('should throw exception when the API call fails', () async {
      // Simulando uma falha na chamada de API
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.categoriesUrl),
        statusCode: 400,
        data: jsonEncode(mockCategory.getCategoriesFail()), // Usando o mock de falha
      );

      when(mockApiService.get(APIConstants.categoriesUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await categoryService.fetchCategories(),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when data is empty or null', () async {
      // Mockando resposta com dados vazios
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.categoriesUrl),
        statusCode: 200,
        data: jsonEncode({'categorias': []}), // Lista de categorias vazia
      );

      when(mockApiService.get(APIConstants.categoriesUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await categoryService.fetchCategories(),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when the data format is invalid', () async {
      // Mockando uma resposta com formato de dados inesperado
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.categoriesUrl),
        statusCode: 200,
        data: 'invalid json string',
      );

      when(mockApiService.get(APIConstants.categoriesUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await categoryService.fetchCategories(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
