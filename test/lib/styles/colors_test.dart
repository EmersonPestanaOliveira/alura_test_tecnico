import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';

void main() {
  group('AppColors Tests', () {
    test('should have correct primary colors', () {
      expect(AppColors.primary, const Color(0xFF780BF7));
      expect(AppColors.primaryVariant, const Color(0xFF430091));
    });

    test('should have correct secondary colors', () {
      expect(AppColors.secondary, const Color(0xFF8FFF24));
      expect(AppColors.secondaryVariant, const Color(0xFFFF55DF));
    });

    test('should have correct background and surface colors', () {
      expect(AppColors.background, const Color(0xFFFFFFFF));
      expect(AppColors.surface, const Color(0xFFEFEFEF));
    });

    test('should have correct text colors', () {
      expect(AppColors.textPrimary, const Color(0xFF090129));
      expect(AppColors.textSecondary, const Color(0xFF444444));
      expect(AppColors.textHint, const Color(0xFF9A9A9A));
    });

    test('should have correct error color', () {
      expect(AppColors.error, const Color(0xFFFF0000));
    });

    test('should have correct accent colors', () {
      expect(AppColors.accent, const Color(0xFF080127));
      expect(AppColors.accentSecundary, const Color(0xFF6A82FB));
    });
  });
}
