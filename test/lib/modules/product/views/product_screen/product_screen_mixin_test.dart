import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o ProductScreenMixin

void main() {
  group('ProductScreenMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(ProductScreenMixin.iconSize, 40.0);
      expect(ProductScreenMixin.paddingHorizontal, 10.0);
      expect(ProductScreenMixin.appBarActionSpacing, 16.0);
      expect(ProductScreenMixin.imageSectionPadding, 16.0);
      expect(ProductScreenMixin.imageSectionHeightRatio, 0.5);

      // Testando valores de string
      expect(ProductScreenMixin.perfilIconAsset, 'assets/icons/general/perfil.svg');
      expect(ProductScreenMixin.carIconAsset, 'assets/icons/general/car.svg');
      expect(ProductScreenMixin.placeHolderAsset, 'assets/images/placeholder.png');
      expect(ProductScreenMixin.appBarActionsPerfil, 'Perfil');
      expect(ProductScreenMixin.appBarActionsCar, 'Carrinho');
    });
  });
}
