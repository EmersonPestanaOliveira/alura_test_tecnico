import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart'; // Ajuste o caminho conforme necessário
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

class MockProductCubit extends MockCubit<ProductState> implements ProductCubit {}

class MockCategoryCubit extends MockCubit<CategoryState> implements CategoryCubit {}

void main() {
  late MockProductCubit mockProductCubit;
  late MockCategoryCubit mockCategoryCubit;

  setUp(() {
    // Cria instâncias mock dos Cubits
    mockProductCubit = MockProductCubit();
    mockCategoryCubit = MockCategoryCubit();
  });

  Widget createAppBootstrapScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>.value(value: mockProductCubit),
        BlocProvider<CategoryCubit>.value(value: mockCategoryCubit),
      ],
      child:  MaterialApp(
        home: HomePage(),
      ),
    );
  }

  group('AppBootstrap Tests', () {
    testWidgets('should render the HomePage', (WidgetTester tester) async {
      await tester.pumpWidget(createAppBootstrapScreen());

      // Verifica se a HomePage é renderizada
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('should call fetchProducts on ProductCubit', (WidgetTester tester) async {
      await tester.pumpWidget(createAppBootstrapScreen());

      // Verifica se o fetchProducts foi chamado no ProductCubit
      verify(mockProductCubit.fetchProducts()).called(1);
    });

    testWidgets('should call fetchCategories on CategoryCubit', (WidgetTester tester) async {
      await tester.pumpWidget(createAppBootstrapScreen());

      // Verifica se o fetchCategories foi chamado no CategoryCubit
      verify(mockCategoryCubit.fetchCategories()).called(1);
    });
  });
}
