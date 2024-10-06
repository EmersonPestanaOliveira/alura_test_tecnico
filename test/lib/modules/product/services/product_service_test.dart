import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../../../mocks/mock_product.dart'; // Ajuste o caminho conforme necessário

void main() {
  late ProductService productService;
  late MockApiService mockApiService;
  late MockProduct mockProduct;

  setUp(() {
    mockApiService = MockApiService();
    productService = ProductService(mockApiService);
    mockProduct = MockProduct();
  });

  group('ProductService Tests', () {
    test('should fetch and return a list of products when the API call is successful', () async {
      // Mockando a resposta da API com sucesso
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.productsUrl),
        statusCode: 200,
        data: jsonEncode(mockProduct.getProductsSuccess()), // Usando o mock de produto
      );

      when(mockApiService.get(APIConstants.productsUrl)).thenAnswer((_) async => mockResponse);

      // Verificação
      final result = await productService.fetchProducts();

      expect(result.length, 15); // Verifica se o número de produtos está correto
      expect(result.first.name, 'Camiseta Básica'); // Verifica o primeiro produto
      verify(mockApiService.get(APIConstants.productsUrl)).called(1);
    });

    test('should throw exception when the API call fails', () async {
      // Simulando uma falha na chamada de API
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.productsUrl),
        statusCode: 400,
        data: jsonEncode(mockProduct.getProductsFail()), // Usando o mock de falha
      );

      when(mockApiService.get(APIConstants.productsUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await productService.fetchProducts(),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when data is empty or null', () async {
      // Mockando resposta com dados vazios
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.productsUrl),
        statusCode: 200,
        data: jsonEncode({'produtos': []}), // Lista de produtos vazia
      );

      when(mockApiService.get(APIConstants.productsUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await productService.fetchProducts(),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when the data format is invalid', () async {
      // Mockando uma resposta com formato de dados inesperado
      final mockResponse = Response(
        requestOptions: RequestOptions(path: APIConstants.productsUrl),
        statusCode: 200,
        data: 'invalid json string',
      );

      when(mockApiService.get(APIConstants.productsUrl)).thenAnswer((_) async => mockResponse);

      expect(
        () async => await productService.fetchProducts(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
