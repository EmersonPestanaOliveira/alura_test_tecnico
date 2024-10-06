import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';

void main() {
  group('Category Model Tests', () {
    final validJson = {
      'id': 1,
      'nome': 'roupas',
      'imagem': 'https://picsum.photos/321/253?random=1',
    };

    final invalidJson = {
      'nome': 'roupas',
      'imagem': 'https://picsum.photos/321/253?random=1',
    };

    const category = Category(
      id: 1,
      name: 'roupas',
      imagePath: 'https://picsum.photos/321/253?random=1',
    );

    test('fromJson should return a valid Category object', () {
      final result = Category.fromJson(validJson);

      expect(result, isA<Category>());
      expect(result.id, 1);
      expect(result.name, 'roupas');
      expect(result.imagePath, 'https://picsum.photos/321/253?random=1');
    });

    test('fromJson should throw ArgumentError when required fields are missing', () {
      expect(() => Category.fromJson(invalidJson), throwsArgumentError);
    });

    test('toJson should return a valid JSON representation of the Category object', () {
      final result = category.toJson();

      expect(result['id'], 1);
      expect(result['nome'], 'roupas');
      expect(result['imagem'], 'https://picsum.photos/321/253?random=1');
    });

    test('fromJsonList should return a list of Category objects when given valid JSON list', () {
      final jsonList = [
        {
          'id': 1,
          'nome': 'roupas',
          'imagem': 'https://picsum.photos/321/253?random=1',
        },
        {
          'id': 2,
          'nome': 'decoração',
          'imagem': 'https://picsum.photos/321/253?random=2',
        },
      ];

      final result = Category.fromJsonList(jsonList);

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].name, 'roupas');
      expect(result[1].id, 2);
      expect(result[1].name, 'decoração');
    });

    test('fromJsonList should return an empty list when given null or empty list', () {
      final result = Category.fromJsonList(null);
      expect(result, isEmpty);
    });

    test('fromJsonList should throw ArgumentError when given invalid JSON format', () {
      final invalidJsonList = [
        {
          'id': 1,
          'nome': 'roupas',
          'imagem': 'https://picsum.photos/321/253?random=1',
        },
        'invalidItem',
      ];

      expect(() => Category.fromJsonList(invalidJsonList), throwsArgumentError);
    });

    test('props should return correct properties for comparison', () {
      expect(
        category.props,
        [1, 'roupas', 'https://picsum.photos/321/253?random=1'],
      );
    });
  });
}
