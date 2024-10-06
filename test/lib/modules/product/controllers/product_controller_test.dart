import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário
import '../../../../mocks/mocks.mocks.dart';

void main() {
  late ProductController productController;
  late MockProductService mockProductService;

  setUp(() {
    mockProductService = MockProductService();
    productController = ProductController(mockProductService);
  });

  group('ProductController Tests', () {
    test('should return a list of products when getProducts is called', () async {
      // Mockando o serviço para retornar uma lista de produtos
      final mockProducts = [
        const Product(id: 1, name: 'Product A', categoriaId: 1, price: 10, imagePath: ''),
        const Product(id: 2, name: 'Product B', categoriaId: 2, price: 20, imagePath: ''),
      ];

      when(mockProductService.fetchProducts()).thenAnswer((_) async => mockProducts);

      // Verificação
      final result = await productController.getProducts();

      expect(result, mockProducts);
      verify(mockProductService.fetchProducts()).called(1);
    });

    test('should throw exception when getProducts fails', () async {
      // Simulando uma falha ao buscar produtos
      when(mockProductService.fetchProducts()).thenThrow(Exception('Failed to fetch products'));

      expect(() => productController.getProducts(), throwsException);
    });

    test('should filter products by name', () {
      // Mockando uma lista de produtos
      final products = [
        Product(id: 1, name: 'Apple', categoriaId: 1, price: 10, imagePath: ''),
        Product(id: 2, name: 'Banana', categoriaId: 2, price: 20, imagePath: ''),
      ];

      // Chamando o método para filtrar produtos pelo nome
      final result = productController.filterProductsByName(products, 'App');

      expect(result.length, 1);
      expect(result.first.name, 'Apple');
    });

    test('should filter products by category', () {
      // Mockando uma lista de produtos
      final products = [
        const Product(id: 1, name: 'Apple', categoriaId: 1, price: 10, imagePath: ''),
        const Product(id: 2, name: 'Banana', categoriaId: 2, price: 20, imagePath: ''),
      ];

      // Chamando o método para filtrar produtos pela categoria
      final result = productController.filterProductsByCategory(products, 1);

      expect(result.length, 1);
      expect(result.first.categoriaId, 1);
    });

    test('should filter products by name and category', () {
      // Mockando uma lista de produtos
      final products = [
        const Product(id: 1, name: 'Apple', categoriaId: 1, price: 10, imagePath: ''),
        const Product(id: 2, name: 'Banana', categoriaId: 2, price: 20, imagePath: ''),
        const Product(id: 3, name: 'Avocado', categoriaId: 1, price: 15, imagePath: ''),
      ];

      // Chamando o método para filtrar por nome e categoria
      final result = productController.filterProducts(
        products,
        nameQuery: 'Av',
        categoryId: 1,
      );

      expect(result.length, 1);
      expect(result.first.name, 'Avocado');
    });
  });
}
