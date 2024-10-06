import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('CategoryConstants Tests', () {
    test('categoryIds should contain correct category ID mappings', () {
      // Verifica se o mapa contém os valores corretos para cada categoria
      expect(CategoryConstants.categoryIds['roupas'], 1);
      expect(CategoryConstants.categoryIds['decoração'], 2);
      expect(CategoryConstants.categoryIds['canecas'], 3);
    });

    test('categoryIds should contain three categories', () {
      // Verifica se o mapa contém exatamente 3 categorias
      expect(CategoryConstants.categoryIds.length, 3);
    });

    test('categoryIds should return null for non-existing categories', () {
      // Verifica se uma categoria inexistente retorna null
      expect(CategoryConstants.categoryIds['eletrônicos'], isNull);
    });
  });
}
