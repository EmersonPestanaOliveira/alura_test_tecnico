import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o HomePageMixin

void main() {
  group('HomePageMixin Tests', () {
    test('should have correct constant values for general layout', () {
      // Testando valores numéricos gerais
      expect(HomePageMixin.iconSize, 40.0);
      expect(HomePageMixin.paddingHorizontal, 16.0);
      expect(HomePageMixin.paddingVertical, 20.0);
      expect(HomePageMixin.bannerHeightRatio, 0.6);
      expect(HomePageMixin.iconSizeMenu, 35.0);
      expect(HomePageMixin.promoBannerHeightRatio, 0.5);
      expect(HomePageMixin.standardBorderRadius, 30.0);
      expect(HomePageMixin.appBarPadding, 8.0);
      expect(HomePageMixin.logoSize, 50.0);
      expect(HomePageMixin.appBarIconPadding, 10.0);
    });

    test('should have correct constant values for promo and banner dimensions', () {
      // Testando dimensões de promoções e banners
      expect(HomePageMixin.promoTextBaseFontSizeRatio, 0.12);
      expect(HomePageMixin.promoTextVerticalSpacing, 1.0);
      expect(HomePageMixin.promoTextHorizontalPaddingRatio, 0.2);
      expect(HomePageMixin.promoButtonPaddingVertical, 32.0);
      expect(HomePageMixin.promoButtonPaddingHorizontal, 50.0);
      expect(HomePageMixin.promoButtonBorderRadius, 30.0);
      expect(HomePageMixin.promoButtonFontSize, 22.0);
      expect(HomePageMixin.verticalSpacing, 2.0);
      expect(HomePageMixin.verticalPadding, 15.0);
    });

    test('should have correct constant values for promo texts', () {
      // Testando textos de promoção
      expect(HomePageMixin.promoTextMain, 'Hora de abraçar');
      expect(HomePageMixin.promoTextSecondaryStart, 'seu ');
      expect(HomePageMixin.promoTextSecondaryMiddle, 'lado');
      expect(HomePageMixin.promoTextFinal, 'geek!');
      expect(HomePageMixin.promoButtonText, 'Ver as novidades!');
    });

    test('should have correct constant values for fonts and duration', () {
      // Testando fontes e duração
      expect(HomePageMixin.fontFamily, 'Poppins');
      expect(HomePageMixin.searchHint, 'O que você procura?');
      expect(HomePageMixin.scrollDuration, 1);
    });

    test('should have correct constant values for icon and image paths', () {
      // Testando caminhos de ícones e imagens
      expect(HomePageMixin.searchIcon, 'assets/icons/general/search_outlined.svg');
      expect(HomePageMixin.appBarIconPathPerfil, 'assets/icons/general/perfil.svg');
      expect(HomePageMixin.appBarIconPathCar, 'assets/icons/general/car.svg');
      expect(HomePageMixin.promoBannerBackgroundPath, 'assets/backgrounds/purple.svg');
      expect(HomePageMixin.bannerImagePath, 'assets/backgrounds/banner.png');
      expect(HomePageMixin.logoPath, 'assets/logos/logo.svg');
    });
  });
}
