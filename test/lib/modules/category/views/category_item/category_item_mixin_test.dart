import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoryItemMixin

void main() {
  group('CategoryItemMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(CategoryItemMixin.paddingAll, 16.0);
      expect(CategoryItemMixin.containerHeightRatio, 0.35);
      expect(CategoryItemMixin.containerWidthRatio, 0.9);
      expect(CategoryItemMixin.boxShadowSpreadRadius, 2.0);
      expect(CategoryItemMixin.boxShadowBlurRadius, 8.0);
      expect(CategoryItemMixin.boxShadowOffset, const Offset(2, 4));
      expect(CategoryItemMixin.imageHeight, 200.0);
      expect(CategoryItemMixin.titleFontSize, 32.0);
      expect(CategoryItemMixin.errorSize, 50.0);

      // Testando valores de string
      expect(CategoryItemMixin.fontFamilyOrbitron, 'Orbitron');
    });
  });
}
