import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/constantes/api_constants.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('APIConstants Tests', () {
    test('should have correct products URL', () {
      // Verifica se a URL de produtos está correta
      const expectedProductsUrl = 'https://gist.githubusercontent.com/viniciosneves/946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json';
      expect(APIConstants.productsUrl, expectedProductsUrl);
    });

    test('should have correct categories URL', () {
      // Verifica se a URL de categorias está correta
      const expectedCategoriesUrl = 'https://gist.githubusercontent.com/viniciosneves/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json';
      expect(APIConstants.categoriesUrl, expectedCategoriesUrl);
    });
  });
}
