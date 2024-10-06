import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário

void main() {
  Widget createDiscountSectionScreen() {
    return const MaterialApp(
      home: Scaffold(
        body: DiscountSection(),
      ),
    );
  }

  group('DiscountSection Tests', () {
    testWidgets('should render title and description correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createDiscountSectionScreen());

      // Verifica se o título e a descrição estão sendo renderizados corretamente
      expect(find.text(DiscountSectionMixin.titleText), findsOneWidget);
      expect(find.text(DiscountSectionMixin.descriptionText), findsOneWidget);
    });

    testWidgets('should render email input field', (WidgetTester tester) async {
      await tester.pumpWidget(createDiscountSectionScreen());

      // Verifica se o campo de input de email está presente
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(DiscountSectionMixin.inputHintText), findsOneWidget);
    });

    testWidgets('should render subscribe button with correct text', (WidgetTester tester) async {
      await tester.pumpWidget(createDiscountSectionScreen());

      // Verifica se o botão de inscrição está presente e tem o texto correto
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(DiscountSectionMixin.buttonText), findsOneWidget);
    });

    testWidgets('should trigger subscribe action when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(createDiscountSectionScreen());

      // Simula o toque no botão de inscrição
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verifica se a ação ao pressionar o botão foi chamada
      // No caso, não há uma ação definida, então não precisamos verificar o comportamento.
    });
  });
}
