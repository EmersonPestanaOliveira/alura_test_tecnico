import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CustomDrawerMixin

void main() {
  group('CustomDrawerMixin Tests', () {
    test('should have correct user information', () {
      // Testando informações do usuário
      expect(CustomDrawerMixin.accountName, 'Emerson Pestana Oliveira');
      expect(CustomDrawerMixin.accountEmail, 'emersonpestana.o@gmail.com');
      expect(CustomDrawerMixin.userImagePath, 'assets/images/pacman_decoration.png');
      expect(CustomDrawerMixin.backgroundHeaderImagePath, 'assets/images/pacman_decoration.png');
    });

    test('should have correct drawer header style', () {
      // Testando estilo do Drawer Header
      expect(CustomDrawerMixin.userImageBorderRadius, 75.0);
      expect(CustomDrawerMixin.userImageShadowSpreadRadius, 5.0);
      expect(CustomDrawerMixin.userImageShadowBlurRadius, 10.0);
      expect(CustomDrawerMixin.userImageShadowOffsetY, 5.0);
    });

    test('should have correct drawer icon dimensions and shadow', () {
      // Testando dimensões e sombra dos ícones do drawer
      expect(CustomDrawerMixin.drawerIconWidth, 50.0);
      expect(CustomDrawerMixin.drawerIconHeight, 50.0);
      expect(CustomDrawerMixin.drawerIconShadowColor, Colors.black);
      expect(CustomDrawerMixin.drawerIconShadowOpacity, 0.2);
    });

    test('should have correct category information', () {
      // Testando informações das categorias
      expect(CustomDrawerMixin.category1Title, 'Roupas');
      expect(CustomDrawerMixin.category1ImagePath, 'assets/images/mario_tshirt.png');
      expect(CustomDrawerMixin.category1Id, 1);

      expect(CustomDrawerMixin.category2Title, 'Decoração');
      expect(CustomDrawerMixin.category2ImagePath, 'assets/images/pacman_decoration.png');
      expect(CustomDrawerMixin.category2Id, 2);

      expect(CustomDrawerMixin.category3Title, 'Canecas');
      expect(CustomDrawerMixin.category3ImagePath, 'assets/images/baby_yoda.png');
      expect(CustomDrawerMixin.category3Id, 3);
    });
  });
}
