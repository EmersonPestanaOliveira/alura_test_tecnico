import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoriesSectionMixin

void main() {
  group('CategoriesSectionMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(CategoriesSectionMixin.sectionSpacing, 20.0);
      expect(CategoriesSectionMixin.titleFontSize, 24.0);
      expect(CategoriesSectionMixin.descriptionFontSize, 16.0);
      expect(CategoriesSectionMixin.categoryItemSpacing, 12.0);
      expect(CategoriesSectionMixin.smallSpacing, 8.0);
      expect(CategoriesSectionMixin.sectionPadding, const EdgeInsets.all(16.0));
      
      // Testando valores de string
      expect(CategoriesSectionMixin.titleText, 'Categorias');
      expect(CategoriesSectionMixin.descriptionText, 'De roupas a gadgets tecnológicos temos tudo para atender suas paixões e hobbies com estilo e autenticidade.');
      expect(CategoriesSectionMixin.noCategoriesText, 'Nenhuma categoria disponível.');
      expect(CategoriesSectionMixin.errorText, 'Ocorreu um erro ao carregar categorias.');
    });
  });
}
