import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste conforme necessário

void main() {
  Widget createCustomDrawerScreen() {
    return const MaterialApp(
      home: Scaffold(
        drawer: CustomDrawer(),
      ),
    );
  }

  group('CustomDrawer Tests', () {
    testWidgets('should render user account information', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Verifica se o nome e o e-mail do usuário estão sendo renderizados corretamente
      expect(find.text(CustomDrawerMixin.accountName), findsOneWidget);
      expect(find.text(CustomDrawerMixin.accountEmail), findsOneWidget);
    });

    testWidgets('should render user account picture', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Verifica se a imagem de perfil do usuário está sendo renderizada corretamente
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('should render background image in UserAccountsDrawerHeader', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Verifica se a imagem de fundo está sendo renderizada corretamente no cabeçalho
      expect(find.byType(DecorationImage), findsOneWidget);
    });

    testWidgets('should render category items with correct titles', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Verifica se os títulos das categorias estão sendo renderizados corretamente
      expect(find.text(CustomDrawerMixin.category1Title), findsOneWidget);
      expect(find.text(CustomDrawerMixin.category2Title), findsOneWidget);
      expect(find.text(CustomDrawerMixin.category3Title), findsOneWidget);
    });

    testWidgets('should navigate to CategoryScreen when category is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Simula o toque no item de categoria "Roupas"
      await tester.tap(find.text(CustomDrawerMixin.category1Title));
      await tester.pumpAndSettle();

      // Verifica se a navegação ocorreu para a CategoryScreen com o ID correto
      expect(find.byType(CategoryScreen), findsOneWidget);
    });

    testWidgets('should render the InfosSection widget', (WidgetTester tester) async {
      await tester.pumpWidget(createCustomDrawerScreen());

      // Verifica se o widget InfosSection está sendo renderizado
      expect(find.byType(InfosSection), findsOneWidget);
    });
  });
}
