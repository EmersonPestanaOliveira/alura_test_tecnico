import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o PromosSectionMixin

void main() {
  group('PromosSectionMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(PromosSectionMixin.sectionPadding, 16.0);
      expect(PromosSectionMixin.promoItemSpacing, 20.0);
      expect(PromosSectionMixin.topPadding, 20.0);
      
      // Testando valores de string
      expect(PromosSectionMixin.promoTitle, 'Promos especiais');
      expect(PromosSectionMixin.seeMore, 'Ver mais');
    });
  });
}
