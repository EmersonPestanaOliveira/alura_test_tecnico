import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('CategoryUtils Tests', () {
    final Map<String, int> categoryIds = {
      'roupas': 1,
      'decoração': 2,
      'canecas': 3,
    };

    test('getCategoryId should return correct ID for valid category', () {
      // Verifica se o método retorna o ID correto para uma categoria válida
      expect(CategoryUtils.getCategoryId('roupas', categoryIds), 1);
      expect(CategoryUtils.getCategoryId('decoração', categoryIds), 2);
      expect(CategoryUtils.getCategoryId('canecas', categoryIds), 3);
    });

    test('getCategoryId should return 0 for invalid category', () {
      // Verifica se o método retorna 0 para uma categoria inválida
      expect(CategoryUtils.getCategoryId('eletrônicos', categoryIds), 0);
      expect(CategoryUtils.getCategoryId('móveis', categoryIds), 0);
    });

    test('getCategoryId should be case insensitive', () {
      // Verifica se o método é case-insensitive (não diferencia maiúsculas de minúsculas)
      expect(CategoryUtils.getCategoryId('ROUPAS', categoryIds), 1);
      expect(CategoryUtils.getCategoryId('Decoração', categoryIds), 2);
      expect(CategoryUtils.getCategoryId('CaNeCas', categoryIds), 3);
    });

    test('getCategoryId should return 0 for empty or null category', () {
      // Verifica se o método retorna 0 para uma categoria vazia ou nula
      expect(CategoryUtils.getCategoryId('', categoryIds), 0);
      expect(CategoryUtils.getCategoryId('', categoryIds), 0); 
    });
  });
}
