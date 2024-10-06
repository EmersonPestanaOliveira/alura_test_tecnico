import 'package:flutter/material.dart';
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
  const promoTitle = 'Promoção Especial';
  const promoImagePath = 'https://example.com/promo_image.png';
  const promoPrice = 99.99;

  Widget createPromoItemScreen() {
    return const MaterialApp(
      home: PromoItem(
        title: promoTitle,
        imagePath: promoImagePath,
        price: promoPrice,
      ),
    );
  }

  setUpAll(() {
    // Substituir o HttpClient global por um mock para evitar requisições de rede reais
    HttpOverrides.global = MockHttpOverrides();
  });

  group('PromoItem Tests', () {
    testWidgets('should render promo title and price', (WidgetTester tester) async {
      await tester.pumpWidget(createPromoItemScreen());

      // Verifica se o título e o preço estão sendo renderizados corretamente
      expect(find.text(promoTitle), findsOneWidget);
      expect(find.text('99,99'), findsOneWidget); // Verificando o preço formatado
    });

    testWidgets('should render promo image', (WidgetTester tester) async {
      await tester.pumpWidget(createPromoItemScreen());

      // Verifica se a imagem da promoção foi renderizada
      expect(find.byType(Image), findsOneWidget);
    });

   /*  testWidgets('should render placeholder image when image fails to load', (WidgetTester tester) async {
      await tester.pumpWidget(createPromoItemScreen());

      // Simula uma falha no carregamento da imagem de rede
      final errorWidget = find.byType(Image).evaluate().single.widget as Image;
      errorWidget.errorBuilder!(tester.element(find.byType(Image)), Object(), StackTrace.empty);

      await tester.pump();

      // Verifica se a imagem placeholder é exibida
      final placeholderImage = find.byType(Image).evaluate().single.widget as Image;
      expect((placeholderImage.image as AssetImage).assetName, PromoItemMixin.placeHolderAsset);
    }); */

  /*   testWidgets('should navigate to ProductScreen on tap', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PromoItem(
          title: promoTitle,
          imagePath: promoImagePath,
          price: promoPrice,
        ),
      ));

      // Simula o toque no PromoItem
      await tester.tap(find.byType(PromoItem));
      await tester.pumpAndSettle();

      // Verifica se a navegação ocorreu para a ProductScreen
      expect(find.byType(ProductScreen), findsOneWidget);
      expect(find.text(promoTitle), findsOneWidget); // Verifica o título na ProductScreen
      expect(find.text('99,99'), findsOneWidget);    // Verifica o preço formatado na ProductScreen
    }); */
  });
}
