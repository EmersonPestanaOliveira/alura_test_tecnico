import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoriesSection
import 'dart:io'; // Para mockar o HttpClient

class MockCategoryCubit extends MockCubit<CategoryState> implements CategoryCubit {}

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

void main() {
  late MockCategoryCubit mockCategoryCubit;

  setUpAll(() {
    // Intercepta o HttpClient globalmente para evitar requisições de rede reais
    HttpOverrides.global = MockHttpOverrides();
  });

  setUp(() {
    mockCategoryCubit = MockCategoryCubit();
  });

  Widget createCategoriesSection() {
    return MaterialApp(
      home: BlocProvider<CategoryCubit>.value(
        value: mockCategoryCubit,
        child: const CategoriesSection(),
      ),
    );
  }

  group('CategoriesSection Tests', () {
    testWidgets('should render section title', (WidgetTester tester) async {
      // Verifica se o título da seção está sendo renderizado corretamente
      await tester.pumpWidget(createCategoriesSection());
      expect(find.text(CategoriesSectionMixin.titleText), findsOneWidget);
    });

    testWidgets('should display CircularProgressIndicator when loading', (WidgetTester tester) async {
      // Simula o estado de carregamento
      when(mockCategoryCubit.state).thenReturn(CategoryState(
        isLoading: true,
        categories: [],
      ));

      await tester.pumpWidget(createCategoriesSection());

      // Verifica se o indicador de carregamento está sendo exibido
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when there is an error', (WidgetTester tester) async {
      const errorMessage = 'Erro ao carregar categorias';
      // Simula o estado de erro
      when(mockCategoryCubit.state).thenReturn(CategoryState(
        errorMessage: errorMessage,
        categories: [],
        isLoading: false,
      ));

      await tester.pumpWidget(createCategoriesSection());

      // Verifica se a mensagem de erro está sendo exibida
      expect(find.text(CategoriesSectionMixin.errorText), findsOneWidget);
    });

    testWidgets('should display empty message when category list is empty', (WidgetTester tester) async {
      // Simula o estado de lista vazia
      when(mockCategoryCubit.state).thenReturn(CategoryState(
        categories: [],
        isLoading: false,
      ));

      await tester.pumpWidget(createCategoriesSection());

      // Verifica se a mensagem de lista vazia está sendo exibida
      expect(find.text(CategoriesSectionMixin.noCategoriesText), findsOneWidget);
    });

    testWidgets('should display category list when categories are available', (WidgetTester tester) async {
      final categories = [
        const Category(id: 1, name: 'Categoria 1', imagePath: 'path/to/image1'),
        const Category(id: 2, name: 'Categoria 2', imagePath: 'path/to/image2'),
      ];

      // Simula o estado com categorias disponíveis
      when(mockCategoryCubit.state).thenReturn(CategoryState(
        categories: categories,
        isLoading: false,
      ));

      await tester.pumpWidget(createCategoriesSection());

      // Verifica se as categorias estão sendo exibidas
      expect(find.text('Categoria 1'), findsOneWidget);
      expect(find.text('Categoria 2'), findsOneWidget);
    });
  });
}
