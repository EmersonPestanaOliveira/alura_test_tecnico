import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/utils/string_utils.dart';

void main() {
  group('capitalize function', () {
    test('should capitalize the first letter of a lowercase string', () {
      final result = capitalize('hello');
      expect(result, 'Hello');
    });

    test('should capitalize the first letter of a mixed case string', () {
      final result = capitalize('hELLo');
      expect(result, 'Hello');
    });

    test('should return an empty string if input is empty', () {
      final result = capitalize('');
      expect(result, '');
    });

    test('should capitalize the first letter of an uppercase string', () {
      final result = capitalize('HELLO');
      expect(result, 'Hello');
    });

    test('should handle single letter strings', () {
      final result = capitalize('a');
      expect(result, 'A');
    });

    test('should handle a string with only spaces', () {
      final result = capitalize('     ');
      expect(result, '     '); // Retorna espaços inalterados
    });
  });
}
