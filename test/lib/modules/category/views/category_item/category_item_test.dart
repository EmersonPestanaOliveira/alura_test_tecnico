import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:io'; // Necessário para mockar o HttpClient
import 'package:technical_project/core/imports_core.dart'; // Importe seu core aqui

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

void main() {
  const categoryTitle = 'Categoria Exemplo';
  const categoryImagePath = 'https://example.com/category_image.png';

  Widget createCategoryItemScreen() {
    return const MaterialApp(
      home: CategoryItem(
        title: categoryTitle,
        imagePath: categoryImagePath,
      ),
    );
  }

  setUpAll(() {
    // Substituir o HttpClient global por um mock para evitar requisições de rede reais
    HttpOverrides.global = MockHttpOverrides();
  });

  group('CategoryItem Tests', () {
    testWidgets('should render category title', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryItemScreen());

      // Verifica se o título da categoria está sendo renderizado corretamente
      expect(find.text('Categoria exemplo'), findsOneWidget); // Verifica o título formatado corretamente
    });

    testWidgets('should render category image', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryItemScreen());

      // Verifica se a imagem da categoria foi renderizada
      expect(find.byType(Image), findsOneWidget);
    });

   /*  testWidgets('should render error icon when image fails to load', (WidgetTester tester) async {
      await tester.pumpWidget(createCategoryItemScreen());

      // Simula uma falha no carregamento da imagem de rede
      final errorWidget = find.byType(Image).evaluate().single.widget as Image;
      errorWidget.errorBuilder!(tester.element(find.byType(Image)), Object(), StackTrace.empty);

      await tester.pump();

      // Verifica se o ícone de erro é exibido
      expect(find.byIcon(Icons.error), findsOneWidget);
    }); */

    /* testWidgets('should navigate to CategoryScreen on tap', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CategoryItem(
          title: categoryTitle,
          imagePath: categoryImagePath,
        ),
      ));

      // Simula o toque no CategoryItem
      await tester.tap(find.byType(CategoryItem));
      await tester.pumpAndSettle();

      // Verifica se a navegação ocorreu para a CategoryScreen
      expect(find.byType(CategoryScreen), findsOneWidget);
      expect(find.text('Categoria exemplo'), findsOneWidget); // Verifica o título na CategoryScreen
    }); */
  });
}
