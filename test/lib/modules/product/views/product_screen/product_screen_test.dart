import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';
import 'package:technical_project/core/imports_core.dart';

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  const productName = 'Produto Exemplo';
  const productImagePath = 'https://example.com/image.png';
  const productPrice = 50.0;

  Widget createProductScreen() {
    return const MaterialApp(
      home: ProductScreen(
        name: productName,
        imagePath: productImagePath,
        price: productPrice,
      ),
    );
  }

  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  group('ProductScreen Tests', () {
    testWidgets('should render product name in the AppBar', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Verifica que o nome do produto aparece no AppBar
      expect(
        find.descendant(of: find.byType(AppBar), matching: find.text(productName)),
        findsOneWidget,
      );
    });

    testWidgets('should render product name in multiple sections', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Verifica que o nome do produto aparece duas vezes (AppBar e na seção de preços)
      expect(find.text(productName), findsNWidgets(2));
    });

    testWidgets('should render icons in AppBar actions', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Verifica se os ícones do AppBar são renderizados corretamente
      expect(find.bySemanticsLabel(ProductScreenMixin.appBarActionsPerfil), findsOneWidget);
      expect(find.bySemanticsLabel(ProductScreenMixin.appBarActionsCar), findsOneWidget);
    });

    testWidgets('should render product image', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Verifica se a imagem do produto foi renderizada
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display price section with formatted price', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Verifica se a seção de preço exibe o preço formatado corretamente
      expect(find.text('Valor: 50,00'), findsOneWidget);
    });

   /*  testWidgets('should render placeholder image when image fails to load', (WidgetTester tester) async {
      await tester.pumpWidget(createProductScreen());

      // Simula uma falha no carregamento da imagem de rede
      await tester.runAsync(() async {
        final errorWidget = find.byType(Image).evaluate().single.widget as Image;
        errorWidget.errorBuilder!(tester.element(find.byType(Image)), Object(), StackTrace.empty);
      });

      await tester.pump();

      // Verifica se a imagem placeholder é exibida
      final placeholderImage = find.byType(Image).evaluate().single.widget as Image;
      expect((placeholderImage.image as AssetImage).assetName, 'assets/images/placeholder.png');
    }); */
  });
}
