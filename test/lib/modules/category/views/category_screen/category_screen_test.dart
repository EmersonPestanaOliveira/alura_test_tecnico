import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme o caminho para o CategoryScreen
import 'dart:io';

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

  const int categoryId = 1;

  Widget createCategoryScreen() {
    return MaterialApp(
      home: BlocProvider<ProductCubit>.value(
        value: mockProductCubit,
        child: const CategoryScreen(idCategoria: categoryId),
      ),
    );
  }

  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  setUp(() {
    mockProductCubit = MockProductCubit();
  });

  group('CategoryScreen Tests', () {
    testWidgets('should render category screen logo in the AppBar', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryScreen());

      // Verifica se o logo está sendo exibido no AppBar
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.bySemanticsLabel('Logo'), findsOneWidget); // Teste do logo com label opcional
    });

    testWidgets('should render icons in AppBar actions', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryScreen());

      // Verifica se os ícones do AppBar são renderizados corretamente
      expect(find.bySemanticsLabel(CategoryScreenMixin.urlPerfil), findsOneWidget);
      expect(find.bySemanticsLabel(CategoryScreenMixin.urlCar), findsOneWidget);
    });

    testWidgets('should render search field with correct hint text', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryScreen());

      // Verifica se o campo de busca contém o hint correto
      expect(find.text(CategoryScreenMixin.searchHintText), findsOneWidget);
    });

    testWidgets('should display CircularProgressIndicator when loading', (WidgetTester tester) async {
      // Simula o estado de carregamento
      when(mockProductCubit.state).thenReturn(ProductState(
        isLoading: true,
        products: [],
        allProducts: [],
        itemsToShow: 0,
      ));

      await tester.pumpWidget(createCategoryScreen());

      // Verifica se o indicador de carregamento está sendo exibido
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when there is an error', (WidgetTester tester) async {
      const errorMessage = 'Erro ao carregar produtos';

      // Simula o estado de erro
      when(mockProductCubit.state).thenReturn(ProductState(
        errorMessage: errorMessage,
        products: [],
        allProducts: [],
        itemsToShow: 0, isLoading: true,
      ));

      await tester.pumpWidget(createCategoryScreen());

      // Verifica se a mensagem de erro está sendo exibida
      expect(find.text('Erro: $errorMessage'), findsOneWidget);
    });

    testWidgets('should display empty message when product list is empty', (WidgetTester tester) async {
      // Simula o estado de lista vazia
      when(mockProductCubit.state).thenReturn(ProductState(
        products: [],
        allProducts: [],
        itemsToShow: 0, isLoading: true,
      ));

      await tester.pumpWidget(createCategoryScreen());

      // Verifica se a mensagem de lista vazia está sendo exibida
      expect(find.text('Nenhum produto encontrado.'), findsOneWidget);
    });

    testWidgets('should display product list when products are available', (WidgetTester tester) async {
      final products = [
        const Product(id: 1, name: 'Produto 1', imagePath: 'path/to/image1', price: 10.0, categoriaId: 1),
        const Product(id: 2, name: 'Produto 2', imagePath: 'path/to/image2', price: 20.0, categoriaId: 2),
      ];

      // Simula o estado com produtos disponíveis
      when(mockProductCubit.state).thenReturn(ProductState(
        products: products,
        allProducts: products,
        itemsToShow: products.length, isLoading: true,
      ));

      await tester.pumpWidget(createCategoryScreen());

      // Verifica se os produtos estão sendo exibidos
      expect(find.text('Produto 1'), findsOneWidget);
      expect(find.text('Produto 2'), findsOneWidget);
    });
  });
}
