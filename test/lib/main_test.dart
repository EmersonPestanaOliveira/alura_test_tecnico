import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';
import 'package:mockito/mockito.dart';

class MockProductCubit extends Mock implements ProductCubit {}
class MockCategoryCubit extends Mock implements CategoryCubit {}

void main() {
  // Configura o locator de dependências
  setupLocator();

  // Teste para verificar se o locator de serviços está configurado corretamente
  group('Service Locator Tests', () {
    test('should register ProductCubit and CategoryCubit', () {
      expect(getIt<ProductCubit>(), isA<ProductCubit>());
      expect(getIt<CategoryCubit>(), isA<CategoryCubit>());
    });

    test('should register ApiService', () {
      expect(getIt<ApiService>(), isA<ApiService>());
    });

    test('should register ProductService', () {
      expect(getIt<ProductService>(), isA<ProductService>());
    });

    test('should register CategoryService', () {
      expect(getIt<CategoryService>(), isA<CategoryService>());
    });
  });

  // Teste para verificar se o AppBootstrap inicializa corretamente
  group('AppBootstrap Tests', () {
    testWidgets('should display HomePage', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AppBootstrap()));

      // Verifica se a HomePage é exibida corretamente
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
