import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoryScreenMixin

void main() {
  group('CategoryScreenMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(CategoryScreenMixin.paddingHorizontal, 8.0);
      expect(CategoryScreenMixin.paddingVertical, 20.0);
      expect(CategoryScreenMixin.appBarIconSize, 40.0);
      expect(CategoryScreenMixin.logoSize, 50.0);
      expect(CategoryScreenMixin.borderRadiusCircular, 30.0);

      // Testando URLs de imagens
      expect(CategoryScreenMixin.urlLogo, 'assets/logos/logo.svg');
      expect(CategoryScreenMixin.urlPerfil, 'assets/icons/general/perfil.svg');
      expect(CategoryScreenMixin.urlCar, 'assets/icons/general/car.svg');

      // Testando textos
      expect(CategoryScreenMixin.searchHintText, 'O que você procura?');

      // Testando tipografia
      expect(CategoryScreenMixin.fontFamilyPoppins, 'Poppins');
    });
  });
}
