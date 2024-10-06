import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';
import 'package:technical_project/core/imports_core.dart'; // Importe conforme necessário

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

void main() {
  Widget createInfosSectionScreen() {
    return const MaterialApp(
      home: InfosSection(),
    );
  }

  setUpAll(() {
    // Substituir o HttpClient global por um mock para evitar requisições de rede reais
    HttpOverrides.global = MockHttpOverrides();
  });

  group('InfosSection Tests', () {
    testWidgets('should render logo', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se o logo está sendo renderizado
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('should render slogan text', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se o slogan está sendo renderizado corretamente
      expect(find.text(InfosSectionMixin.slogan), findsOneWidget);
    });

    testWidgets('should render operating hours', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se as informações de horário de funcionamento estão sendo renderizadas corretamente
      expect(find.text(InfosSectionMixin.operatingHoursTitle), findsOneWidget);
      expect(find.text(InfosSectionMixin.operatingHoursTime), findsOneWidget);
      expect(find.text(InfosSectionMixin.operatingHoursEmail), findsOneWidget);
      expect(find.text(InfosSectionMixin.operatingHoursPhone), findsOneWidget);
    });

    testWidgets('should render payment methods icons', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se os ícones de formas de pagamento estão sendo renderizados corretamente
      expect(find.byType(SvgPicture), findsNWidgets(6)); // 5 ícones de pagamento + 1 logo
    });

    testWidgets('should render social media icons', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se os ícones das redes sociais estão sendo renderizados corretamente
      expect(find.byIcon(FontAwesomeIcons.whatsapp), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.instagram), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.tiktok), findsOneWidget);
    });

    testWidgets('should render divider', (WidgetTester tester) async {
      await tester.pumpWidget(createInfosSectionScreen());

      // Verifica se o Divider foi renderizado corretamente
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
