import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho correto para o DiscountSectionMixin

void main() {
  group('DiscountSectionMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(DiscountSectionMixin.paddingVertical, 32.0);
      expect(DiscountSectionMixin.paddingHorizontal, 16.0);
      expect(DiscountSectionMixin.textFontSize, 22.0);
      expect(DiscountSectionMixin.descriptionFontSize, 18.0);
      expect(DiscountSectionMixin.inputBorderWidth, 3.0);
      expect(DiscountSectionMixin.buttonFontSize, 28.0);
      expect(DiscountSectionMixin.buttonPaddingHorizontal, 32.0);
      expect(DiscountSectionMixin.buttonPaddingVertical, 8.0);
      expect(DiscountSectionMixin.inputPaddingHorizontal, 30.0);
      expect(DiscountSectionMixin.inputPaddingVertical, 20.0);
      expect(DiscountSectionMixin.borderRadius, 30.0);
      expect(DiscountSectionMixin.buttonBorderRadius, 50.0);
      expect(DiscountSectionMixin.spacingBetweenTitleAndDescription, 25.0);
      expect(DiscountSectionMixin.spacingBetweenDescriptionAndInput, 30.0);
      expect(DiscountSectionMixin.spacingBetweenInputAndButton, 20.0);

      // Testando valores de string (fontes e textos)
      expect(DiscountSectionMixin.fontFamilyOrbitron, 'Orbitron');
      expect(DiscountSectionMixin.fontFamilyPoppins, 'Poppins');
      expect(DiscountSectionMixin.titleText, 'Inscreva-se para ganhar descontos!');
      expect(DiscountSectionMixin.descriptionText, 'Cadastre seu email, receba novidades e descontos imperdíveis antes de todo mundo!');
      expect(DiscountSectionMixin.inputHintText, 'Digite seu melhor endereço de email');
      expect(DiscountSectionMixin.buttonText, 'Inscrever');
    });
  });
}
