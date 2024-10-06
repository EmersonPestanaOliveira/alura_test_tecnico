import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';

void main() {
  group('Imports Test', () {
    test('should access essential Flutter packages', () {
      // Testando acesso ao Flutter Material e Widget básico
      expect(WidgetsFlutterBinding.ensureInitialized, isNotNull);
      expect(MaterialApp, isNotNull);
      expect(Text, isNotNull);
      expect(AppBar, isNotNull);
    });

    test('should access external packages', () {
      // Testando acesso a pacotes externos
      expect(BlocProvider, isNotNull);
      expect(getIt, isNotNull);
      expect(Dio, isNotNull);
      expect(SvgPicture, isNotNull);
      expect(FontAwesomeIcons.whatsapp, isNotNull);
    });

    test('should access project core packages', () {
      // Testando acesso ao núcleo do projeto
      expect(BlocProviders.getProviders, isNotNull);
      expect(AppBootstrap, isNotNull);
      expect(ApiService, isNotNull);
      expect(ProductCubit, isNotNull);
      expect(CategoryCubit, isNotNull);
    });

    test('should access constants and utilities', () {
      // Testando acesso às constantes e utilitários

      expect(AppColors.primary, isNotNull);
      expect(AppTextStyles.bodyRegular, isNotNull);

      expect(ApiErrorsMenssage.erro, isNotNull);
    });

    test('should access category module', () {
      // Testando acesso ao módulo de categorias
      expect(CategoryCubit, isNotNull);
      expect(CategoryController, isNotNull);
      expect(CategoryService, isNotNull);
      expect(Category, isNotNull);
      expect(CategoryUtils.getCategoryId, isNotNull);
    });

    test('should access product module', () {
      // Testando acesso ao módulo de produtos
      expect(ProductCubit, isNotNull);
      expect(ProductController, isNotNull);
      expect(ProductService, isNotNull);
      expect(Product, isNotNull);
      expect(PromoItem, isNotNull);
    });

    test('should access discount module', () {
      // Testando acesso ao módulo de descontos
      expect(DiscountSection, isNotNull);
      expect(DiscountSectionMixin, isNotNull);
    });

    test('should access home module', () {
      // Testando acesso ao módulo Home
      expect(HomePage, isNotNull);
      expect(CustomDrawer, isNotNull);
      expect(HomePageMixin, isNotNull);
    });


  });
}
