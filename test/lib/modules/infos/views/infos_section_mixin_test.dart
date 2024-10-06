import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o InfosSectionMixin

void main() {
  group('InfosSectionMixin Tests', () {
    test('should have correct constant values', () {
      // Testando valores numéricos
      expect(InfosSectionMixin.paddingAll, 55.0);
      expect(InfosSectionMixin.logoPadding, 8.0);
      expect(InfosSectionMixin.spacingHeight, 16.0);
      expect(InfosSectionMixin.smallSpacingHeight, 8.0);
      expect(InfosSectionMixin.iconSpacingWidth, 16.0);
      expect(InfosSectionMixin.iconSize, 32.0);
      expect(InfosSectionMixin.paymentIconWidth, 40.0);
      expect(InfosSectionMixin.sloganfontSize, 12.0);
      expect(InfosSectionMixin.dividerThickness, 2.0);

      // Testando URLs de imagens
      expect(InfosSectionMixin.logoUrlImage, 'assets/logos/logo_green.svg');
      expect(InfosSectionMixin.visaUrl, 'assets/icons/payment_methods/visa.svg');
      expect(InfosSectionMixin.mastercardUrl, 'assets/icons/payment_methods/mastercard.svg');
      expect(InfosSectionMixin.elodUrl, 'assets/icons/payment_methods/elo.svg');
      expect(InfosSectionMixin.dinersdUrl, 'assets/icons/payment_methods/diners.svg');
      expect(InfosSectionMixin.pixUrl, 'assets/icons/payment_methods/pix.svg');

      // Testando valores de string
      expect(InfosSectionMixin.slogan, 'Hora de abraçar seu lado geek!');
      expect(InfosSectionMixin.operatingHoursTitle, 'Funcionamento');
      expect(InfosSectionMixin.operatingHoursTime, 'Segunda a Sexta - 8h às 18h');
      expect(InfosSectionMixin.operatingHoursEmail, 'sac@usedev.com.br');
      expect(InfosSectionMixin.operatingHoursPhone, '0800 541 320');
      expect(InfosSectionMixin.paymentMethodsTitle, 'Formas de Pagamento');
      expect(InfosSectionMixin.socialMediaText, 'Siga nossas redes:');
    });
  });
}
