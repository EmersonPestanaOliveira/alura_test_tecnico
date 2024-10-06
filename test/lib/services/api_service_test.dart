import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:technical_project/services/api_service.dart'; // Ajuste o caminho conforme necessário

class MockDio extends Mock implements Dio {}

void main() {
  late ApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ApiService(mockDio);
  });

  group('ApiService Tests', () {
    const String testUrl = 'https://example.com';

    test('should return Response when the request is successful', () async {
      // Mockando a resposta da API com sucesso
      final mockResponse = Response(
        requestOptions: RequestOptions(path: testUrl),
        statusCode: 200,
        data: 'response data',
      );

      when(mockDio.get(testUrl)).thenAnswer((_) async => mockResponse);

      // Verificação
      final result = await apiService.get(testUrl);

      expect(result, isA<Response>());
      expect(result.data, 'response data');
      verify(mockDio.get(testUrl)).called(1);
    });

    test('should throw DioException when the request fails', () async {
      // Simulando uma falha na chamada de API com DioException
      final mockDioException = DioException(
        requestOptions: RequestOptions(path: testUrl),
        error: 'Request failed',
        response: Response(
          requestOptions: RequestOptions(path: testUrl),
          statusCode: 500,
        ),
        type: DioExceptionType.badResponse,
      );

      when(mockDio.get(testUrl)).thenThrow(mockDioException);

      // Verificação
      expect(() async => await apiService.get(testUrl), throwsA(isA<DioException>()));
      verify(mockDio.get(testUrl)).called(1);
    });

    test('should throw an exception if Dio throws unexpected error', () async {
      // Simulando uma exceção inesperada
      final unexpectedError = Exception('Unexpected error');

      when(mockDio.get(testUrl)).thenThrow(unexpectedError);

      // Verificação
      expect(() async => await apiService.get(testUrl), throwsA(isA<Exception>()));
      verify(mockDio.get(testUrl)).called(1);
    });
  });
}
