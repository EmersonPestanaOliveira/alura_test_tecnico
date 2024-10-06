import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';
import 'package:technical_project/modules/product/models/product_model.dart';

void main() {
  group('Product Model Tests', () {
    final validJson = {
      'id': 1,
      'categoriaId': 1,
      'nome': 'Camiseta Básica',
      'preço': 29.99,
      'imagem': 'https://picsum.photos/312/292?random=4',
    };

    final invalidJson = {
      'categoriaId': 1,
      'nome': 'Camiseta Básica',
      'preço': 29.99,
      'imagem': 'https://picsum.photos/312/292?random=4',
    };

    const product = Product(
      id: 1,
      categoriaId: 1,
      name: 'Camiseta Básica',
      price: 29.99,
      imagePath: 'https://picsum.photos/312/292?random=4',
    );

    test('fromJson should return a valid Product object', () {
      final result = Product.fromJson(validJson);

      expect(result, isA<Product>());
      expect(result.id, 1);
      expect(result.categoriaId, 1);
      expect(result.name, 'Camiseta Básica');
      expect(result.price, 29.99);
      expect(result.imagePath, 'https://picsum.photos/312/292?random=4');
    });

    test('fromJson should throw ArgumentError when required fields are missing', () {
      expect(() => Product.fromJson(invalidJson), throwsArgumentError);
    });

    test('toJson should return a valid JSON representation of the Product object', () {
      final result = product.toJson();

      expect(result['id'], 1);
      expect(result['categoriaId'], 1);
      expect(result['nome'], 'Camiseta Básica');
      expect(result['preço'], 29.99);
      expect(result['imagem'], 'https://picsum.photos/312/292?random=4');
    });

    test('fromJsonList should return a list of Product objects when given valid JSON list', () {
      final jsonList = [
        {
          'id': 1,
          'categoriaId': 1,
          'nome': 'Camiseta Básica',
          'preço': 29.99,
          'imagem': 'https://picsum.photos/312/292?random=4',
        },
        {
          'id': 2,
          'categoriaId': 1,
          'nome': 'Calça Jeans',
          'preço': 79.99,
          'imagem': 'https://picsum.photos/312/292?random=5',
        },
      ];

      final result = Product.fromJsonList(jsonList);

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].name, 'Camiseta Básica');
      expect(result[1].id, 2);
      expect(result[1].name, 'Calça Jeans');
    });

    test('fromJsonList should return an empty list when given null or empty list', () {
      final result = Product.fromJsonList(null);
      expect(result, isEmpty);
    });

    test('fromJsonList should throw ArgumentError when given invalid JSON format', () {
      final invalidJsonList = [
        {
          'id': 1,
          'categoriaId': 1,
          'nome': 'Camiseta Básica',
          'preço': 29.99,
          'imagem': 'https://picsum.photos/312/292?random=4',
        },
        'invalidItem',
      ];

      expect(() => Product.fromJsonList(invalidJsonList), throwsArgumentError);
    });

    test('props should return correct properties for comparison', () {
      expect(
        product.props,
        [1, 1, 'Camiseta Básica', 29.99, 'https://picsum.photos/312/292?random=4'],
      );
    });
  });
}
