import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/constantes/mensages_erros_constants.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('ApiErrorsMenssage Tests', () {
    test('should have correct error message for "erro"', () {
      const expectedMessage = 'Erro:';
      expect(ApiErrorsMenssage.erro, expectedMessage);
    });

    test('should have correct error message for empty product list', () {
      const expectedMessage = 'Nenhum produto disponível.';
      expect(ApiErrorsMenssage.errorProductEmpy, expectedMessage);
    });

    test('should have correct error message for fetching products', () {
      const expectedMessage = 'Erro ao buscar produtos: ';
      expect(ApiErrorsMenssage.errorFetchingProducts, expectedMessage);
    });

    test('should have correct error message for loading products', () {
      const expectedMessage = 'Falha ao carregar produtos. Código de status: ';
      expect(ApiErrorsMenssage.errorLoadingProducts, expectedMessage);
    });

    test('should have correct error message for decoding JSON', () {
      const expectedMessage = 'Erro ao decodificar a string JSON: ';
      expect(ApiErrorsMenssage.errorDecodingJson, expectedMessage);
    });

    test('should have correct error message for unexpected data format', () {
      const expectedMessage = 'Formato de dados inesperado: ';
      expect(ApiErrorsMenssage.errorUnexpectedDataFormat, expectedMessage);
    });

    test('should have correct error message for empty or null product list', () {
      const expectedMessage = 'Lista de produtos está vazia ou nula.';
      expect(ApiErrorsMenssage.errorEmptyOrNullProductList, expectedMessage);
    });

    test('should have correct error message for missing fields in JSON', () {
      const expectedMessage = 'Campos obrigatórios ausentes no JSON';
      expect(ApiErrorsMenssage.errorMissingFields, expectedMessage);
    });

    test('should have correct error message for invalid JSON format', () {
      const expectedMessage = 'Formato de JSON inválido';
      expect(ApiErrorsMenssage.errorInvalidJsonFormat, expectedMessage);
    });

    test('should have correct error message for unexpected error', () {
      const expectedMessage = 'Ocorreu um erro inesperado. Tente novamente mais tarde.';
      expect(ApiErrorsMenssage.errorUnexpected, expectedMessage);
    });

    test('should have correct error message for no products found', () {
      const expectedMessage = 'Nenhum produto encontrado.';
      expect(ApiErrorsMenssage.noProductsFound, expectedMessage);
    });

    test('should have correct error message for loading categories', () {
      const expectedMessage = 'Erro ao carregar categorias: ';
      expect(ApiErrorsMenssage.errorLoadingCategories, expectedMessage);
    });
  });
}
