import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';

void main() {
  group('AppTextStyles Tests', () {
    // Testando estilos de texto com a fonte 'Orbitron'
    test('should have correct h1 Orbitron style', () {
      expect(AppTextStyles.h1.fontFamily, 'Orbitron');
      expect(AppTextStyles.h1.fontSize, 76);
      expect(AppTextStyles.h1.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h1.color, Colors.black);
    });

    test('should have correct h2 Orbitron style', () {
      expect(AppTextStyles.h2.fontFamily, 'Orbitron');
      expect(AppTextStyles.h2.fontSize, 61);
      expect(AppTextStyles.h2.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h2.color, Colors.black);
    });

    test('should have correct h3 Orbitron style', () {
      expect(AppTextStyles.h3.fontFamily, 'Orbitron');
      expect(AppTextStyles.h3.fontSize, 48);
      expect(AppTextStyles.h3.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h3.color, Colors.black);
    });

    test('should have correct h4 Orbitron style', () {
      expect(AppTextStyles.h4.fontFamily, 'Orbitron');
      expect(AppTextStyles.h4.fontSize, 39);
      expect(AppTextStyles.h4.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h4.color, Colors.black);
    });

    test('should have correct h5 Orbitron style', () {
      expect(AppTextStyles.h5.fontFamily, 'Orbitron');
      expect(AppTextStyles.h5.fontSize, 31);
      expect(AppTextStyles.h5.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h5.color, Colors.black);
    });

    test('should have correct h6 Orbitron style', () {
      expect(AppTextStyles.h6.fontFamily, 'Orbitron');
      expect(AppTextStyles.h6.fontSize, 25);
      expect(AppTextStyles.h6.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h6.color, Colors.black);
    });

    test('should have correct h6Small Orbitron style', () {
      expect(AppTextStyles.h6Small.fontFamily, 'Orbitron');
      expect(AppTextStyles.h6Small.fontSize, 16);
      expect(AppTextStyles.h6Small.fontWeight, FontWeight.bold);
      expect(AppTextStyles.h6Small.color, Colors.black);
    });

    // Testando estilos de texto com a fonte 'Poppins'
    test('should have correct headingLarge Poppins style', () {
      expect(AppTextStyles.headingLarge.fontFamily, 'Poppins');
      expect(AppTextStyles.headingLarge.fontSize, 39);
      expect(AppTextStyles.headingLarge.fontWeight, FontWeight.normal);
      expect(AppTextStyles.headingLarge.color, Colors.black);
    });

    test('should have correct headingMedium Poppins style', () {
      expect(AppTextStyles.headingMedium.fontFamily, 'Poppins');
      expect(AppTextStyles.headingMedium.fontSize, 31);
      expect(AppTextStyles.headingMedium.fontWeight, FontWeight.w600);
      expect(AppTextStyles.headingMedium.color, Colors.black);
    });

    test('should have correct headingRegular Poppins style', () {
      expect(AppTextStyles.headingRegular.fontFamily, 'Poppins');
      expect(AppTextStyles.headingRegular.fontSize, 31);
      expect(AppTextStyles.headingRegular.fontWeight, FontWeight.normal);
      expect(AppTextStyles.headingRegular.color, Colors.black);
    });

    test('should have correct headingSmall Poppins style', () {
      expect(AppTextStyles.headingSmall.fontFamily, 'Poppins');
      expect(AppTextStyles.headingSmall.fontSize, 25);
      expect(AppTextStyles.headingSmall.fontWeight, FontWeight.normal);
      expect(AppTextStyles.headingSmall.color, Colors.black);
    });

    // Testando estilos de corpo de texto com a fonte 'Poppins'
    test('should have correct bodyLargeBold Poppins style', () {
      expect(AppTextStyles.bodyLargeBold.fontFamily, 'Poppins');
      expect(AppTextStyles.bodyLargeBold.fontSize, 20);
      expect(AppTextStyles.bodyLargeBold.fontWeight, FontWeight.bold);
      expect(AppTextStyles.bodyLargeBold.color, Colors.black);
    });

    test('should have correct bodyLarge Poppins style', () {
      expect(AppTextStyles.bodyLarge.fontFamily, 'Poppins');
      expect(AppTextStyles.bodyLarge.fontSize, 20);
      expect(AppTextStyles.bodyLarge.fontWeight, FontWeight.normal);
      expect(AppTextStyles.bodyLarge.color, Colors.black);
    });

    test('should have correct bodyRegular Poppins style', () {
      expect(AppTextStyles.bodyRegular.fontFamily, 'Poppins');
      expect(AppTextStyles.bodyRegular.fontSize, 16);
      expect(AppTextStyles.bodyRegular.fontWeight, FontWeight.normal);
      expect(AppTextStyles.bodyRegular.color, Colors.black);
    });

    test('should have correct bodySmallRegular Poppins style', () {
      expect(AppTextStyles.bodySmallRegular.fontFamily, 'Poppins');
      expect(AppTextStyles.bodySmallRegular.fontSize, 13);
      expect(AppTextStyles.bodySmallRegular.fontWeight, FontWeight.normal);
      expect(AppTextStyles.bodySmallRegular.color, Colors.black);
    });

    test('should have correct bodySmallBold Poppins style', () {
      expect(AppTextStyles.bodySmallBold.fontFamily, 'Poppins');
      expect(AppTextStyles.bodySmallBold.fontSize, 13);
      expect(AppTextStyles.bodySmallBold.fontWeight, FontWeight.bold);
      expect(AppTextStyles.bodySmallBold.color, Colors.black);
    });

    test('should have correct bodyExtraSmall Poppins style', () {
      expect(AppTextStyles.bodyExtraSmall.fontFamily, 'Poppins');
      expect(AppTextStyles.bodyExtraSmall.fontSize, 10);
      expect(AppTextStyles.bodyExtraSmall.fontWeight, FontWeight.normal);
      expect(AppTextStyles.bodyExtraSmall.color, Colors.black);
    });
  });
}
