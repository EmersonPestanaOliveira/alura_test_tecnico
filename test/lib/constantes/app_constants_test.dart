import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/constantes/app_constants.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('AppConstants Tests', () {
    test('should have correct default icon size', () {
      // Verifica se o tamanho do ícone padrão está correto
      const expectedIconSize = 40.0;
      expect(AppConstants.defaultIconSize, expectedIconSize);
    });

    test('should have correct default horizontal padding', () {
      // Verifica se o padding horizontal padrão está correto
      const expectedPaddingHorizontal = 16.0;
      expect(AppConstants.defaultPaddingHorizontal, expectedPaddingHorizontal);
    });

    test('should have correct default vertical padding', () {
      // Verifica se o padding vertical padrão está correto
      const expectedPaddingVertical = 20.0;
      expect(AppConstants.defaultPaddingVertical, expectedPaddingVertical);
    });

    test('should have correct placeholder asset path', () {
      // Verifica se o caminho do placeholder está correto
      const expectedPlaceholderAsset = 'assets/images/placeholder.png';
      expect(AppConstants.placeholderAsset, expectedPlaceholderAsset);
    });
  });
}
