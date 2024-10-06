import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; 

void main() {
  group('PromoItemMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(PromoItemMixin.paddingHorizontal, 16.0);
      expect(PromoItemMixin.paddingVertical, 10.0);
      expect(PromoItemMixin.containerHeightRatio, 0.59);
      expect(PromoItemMixin.containerWidthRatio, 0.9);
      expect(PromoItemMixin.imagePadding, 16.0);
      expect(PromoItemMixin.imageHeightimagem, 0.4);
      expect(PromoItemMixin.shadowSpreadRadius, 2.0);
      expect(PromoItemMixin.shadowBlurRadius, 8.0);
      expect(PromoItemMixin.shadowOffset, const Offset(2, 4));
      expect(PromoItemMixin.imageSectionWidthRatio, 0.9);
      expect(PromoItemMixin.multiplierHorizontal, 0.03);
      expect(PromoItemMixin.multiplierVertical, 0.02);
      expect(PromoItemMixin.rounding, 10.0);
      expect(PromoItemMixin.titleAndPricePadding, 0.03);
      expect(PromoItemMixin.titleAndPriceSpacing, 0.01);
      
      // Testando valores de string
      expect(PromoItemMixin.placeHolderAsset, 'assets/images/placeholder.png');
    });
  });
}
