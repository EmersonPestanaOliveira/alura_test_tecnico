import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o PromosSection
import 'dart:io'; // Para mockar o HttpClient

class MockProductCubit extends MockCubit<ProductState> implements ProductCubit {}

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

void main() {
  late MockProductCubit mockProductCubit;

  setUpAll(() {
    // Intercepta o HttpClient globalmente para evitar requisições de rede reais
    HttpOverrides.global = MockHttpOverrides();
  });

  setUp(() {
    mockProductCubit = MockProductCubit();
  });

  Widget createPromosSection() {
    return MaterialApp(
      home: BlocProvider<ProductCubit>.value(
        value: mockProductCubit,
        child: const PromosSection(),
      ),
    );
  }

  group('PromosSection Tests', () {
   testWidgets('should render section title', (WidgetTester tester) async {
      // Verifica se o título da seção está sendo renderizado corretamente
      await tester.pumpWidget(createPromosSection());
      expect(find.text(PromosSectionMixin.promoTitle), findsOneWidget);
    });

    testWidgets('should display CircularProgressIndicator when loading', (WidgetTester tester) async {
      // Simula o estado de carregamento
      when(mockProductCubit.state).thenReturn(ProductState(
        isLoading: true,
        products: [],
        allProducts: [],
        itemsToShow: 0,
      ));

      await tester.pumpWidget(createPromosSection());

      // Verifica se o indicador de carregamento está sendo exibido
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when there is an error', (WidgetTester tester) async {
      const errorMessage = 'Erro ao carregar produtos';
      // Ajuste para passar os parâmetros obrigatórios
      when(mockProductCubit.state).thenReturn(ProductState(
        errorMessage: errorMessage,
        products: [],
        allProducts: [],
        itemsToShow: 0, isLoading: true,
      ));

      await tester.pumpWidget(createPromosSection());

      // Verifica se a mensagem de erro está sendo exibida
      expect(find.text('${ApiErrorsMenssage.erro} $errorMessage'), findsOneWidget);
    });

    testWidgets('should display empty message when product list is empty', (WidgetTester tester) async {
      // Ajuste para passar os parâmetros obrigatórios
      when(mockProductCubit.state).thenReturn(ProductState(
        products: [],
        allProducts: [],
        itemsToShow: 0, isLoading: true,
      ));

      await tester.pumpWidget(createPromosSection());

      // Verifica se a mensagem de lista vazia está sendo exibida
      expect(find.text(ApiErrorsMenssage.errorProductEmpy), findsOneWidget);
    });

    testWidgets('should display product list when products are available', (WidgetTester tester) async {
      final products = [
        const Product(id: 1, name: 'Produto 1', imagePath: 'path/to/image1', price: 10.0, categoriaId: 1),
        const Product(id: 2, name: 'Produto 2', imagePath: 'path/to/image2', price: 20.0, categoriaId: 2),
      ];

      // Ajuste para passar os parâmetros obrigatórios
      when(mockProductCubit.state).thenReturn(ProductState(
        products: products,
        allProducts: products,
        itemsToShow: products.length, isLoading: true,
      ));

      await tester.pumpWidget(createPromosSection());

      // Verifica se os produtos estão sendo exibidos
      expect(find.text('Produto 1'), findsOneWidget);
      expect(find.text('Produto 2'), findsOneWidget);
      expect(find.text('10,00'), findsOneWidget);
      expect(find.text('20,00'), findsOneWidget);
    });

    testWidgets('should display "Ver mais" button when there are more products to load', (WidgetTester tester) async {
      // Ajuste para passar os parâmetros obrigatórios
      when(mockProductCubit.state).thenReturn(ProductState(
        products: [],
        allProducts: [],
        itemsToShow: 0,
         isLoading: true,
      ));

      await tester.pumpWidget(createPromosSection());

      // Verifica se o botão "Ver mais" está sendo exibido
      expect(find.text(PromosSectionMixin.seeMore), findsOneWidget);
    });

    testWidgets('should call increaseItemsToShow when "Ver mais" is tapped', (WidgetTester tester) async {
      // Ajuste para passar os parâmetros obrigatórios
      when(mockProductCubit.state).thenReturn(ProductState(
        products: [],
        allProducts: [],
        itemsToShow: 0,
        isLoading: true,
      ));

      await tester.pumpWidget(createPromosSection());

      // Simula o toque no botão "Ver mais"
      await tester.tap(find.text(PromosSectionMixin.seeMore));
      await tester.pump();

      // Verifica se o método increaseItemsToShow foi chamado
      verify(mockProductCubit.increaseItemsToShow()).called(1);
    });
  });
}
