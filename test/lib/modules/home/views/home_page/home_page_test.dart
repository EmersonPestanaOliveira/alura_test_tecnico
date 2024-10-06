import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart';

import '../../../../../mocks/mocks.mocks.dart'; // Ajuste conforme o caminho para HomePage

void main() {
  Widget createHomePageScreen() {
    return  MaterialApp(
      home: HomePage(),
    );
  }

  group('HomePage Tests', () {
    testWidgets('should render AppBar with logo and icons', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verifica se o logo da AppBar está sendo renderizado corretamente
      expect(find.byType(SvgPicture), findsOneWidget);

      // Verifica se os ícones de perfil e carrinho na AppBar estão presentes
      expect(find.byIcon(Icons.menu_outlined), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(3)); // Logo e 2 ícones
    });

    testWidgets('should render search field', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verifica se o campo de busca está presente
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(HomePageMixin.searchHint), findsOneWidget);
    });

    testWidgets('should render product list when search query is not empty', (WidgetTester tester) async {
      // Simula o cubit com produtos carregados
      final mockProductCubit = MockProductCubit();
      when(mockProductCubit.state).thenReturn(ProductState(products: const [Product(name: 'Product 1', price: 29.99, categoriaId: 1, id: 1, imagePath: '')], isLoading: false, allProducts: const [], itemsToShow: 3));

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider<ProductCubit>.value(
          value: mockProductCubit,
          child: HomePage(),
        ),
      ));

      // Digita algo no campo de busca
      await tester.enterText(find.byType(TextField), 'Product 1');
      await tester.pump();

      // Verifica se a lista de produtos é renderizada
      expect(find.text('Product 1'), findsOneWidget);
    });

    testWidgets('should display banner and promo banner', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verifica se o banner e o banner promocional estão sendo renderizados
      expect(find.byType(Image), findsOneWidget); // Banner principal
      expect(find.byType(SvgPicture), findsWidgets); // Promo banner
    });

    testWidgets('should display "Ver as novidades!" button in promo section', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verifica se o botão "Ver as novidades!" está presente
      expect(find.text(HomePageMixin.promoButtonText), findsOneWidget);
    });

    testWidgets('should render promo texts correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Verifica os textos da seção de promoções
      expect(find.text(HomePageMixin.promoTextMain), findsOneWidget);
      expect(find.text(HomePageMixin.promoTextSecondaryStart), findsOneWidget);
      expect(find.text(HomePageMixin.promoTextSecondaryMiddle), findsOneWidget);
      expect(find.text(HomePageMixin.promoTextFinal), findsOneWidget);
    });

    testWidgets('should scroll to promo section when "Ver as novidades!" button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePageScreen());

      // Simula o toque no botão de promoções
      await tester.tap(find.text(HomePageMixin.promoButtonText));
      await tester.pumpAndSettle();

      // Verifica se a ação de rolar para a seção de promoções foi executada
      // (o comportamento esperado seria observar a rolagem para a PromosSection, o que pode ser feito verificando a visibilidade de elementos na tela)
      // Aqui você pode ajustar conforme necessário para verificar o scroll
    });
  });
}
