import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_project/core/imports_core.dart';

class MockDio extends Mock implements Dio {}
class MockApiService extends Mock implements ApiService {}
class MockCategoryService extends Mock implements CategoryService {}
class MockProductService extends Mock implements ProductService {}
class MockCategoryController extends Mock implements CategoryController {}
class MockProductController extends Mock implements ProductController {}
class MockCategoryCubit extends Mock implements CategoryCubit {}
class MockProductCubit extends Mock implements ProductCubit {}

void main() {
  late GetIt getIt;

  setUp(() {
    getIt = GetIt.instance;
    getIt.reset(); // Reseta o GetIt antes de cada teste
  });

  test('should register all dependencies correctly', () {
    // Executa a configuração do GetIt
    setupLocator();

    // Verifica se as instâncias estão registradas corretamente
    expect(getIt.isRegistered<Dio>(), true);
    expect(getIt.isRegistered<ApiService>(), true);
    expect(getIt.isRegistered<CategoryService>(), true);
    expect(getIt.isRegistered<ProductService>(), true);
    expect(getIt.isRegistered<CategoryController>(), true);
    expect(getIt.isRegistered<ProductController>(), true);
    expect(getIt.isRegistered<CategoryCubit>(), true);
    expect(getIt.isRegistered<ProductCubit>(), true);
  });

  test('should resolve dependencies correctly', () {
    // Executa a configuração do GetIt
    setupLocator();

    // Verifica se o GetIt consegue resolver as instâncias corretas
    expect(getIt<Dio>(), isA<Dio>());
    expect(getIt<ApiService>(), isA<ApiService>());
    expect(getIt<CategoryService>(), isA<CategoryService>());
    expect(getIt<ProductService>(), isA<ProductService>());
    expect(getIt<CategoryController>(), isA<CategoryController>());
    expect(getIt<ProductController>(), isA<ProductController>());
    expect(getIt<CategoryCubit>(), isA<CategoryCubit>());
    expect(getIt<ProductCubit>(), isA<ProductCubit>());
  });

  test('should resolve the same instance for singleton dependencies', () {
    // Executa a configuração do GetIt
    setupLocator();

    // Verifica se as instâncias de singleton são as mesmas
    final dio1 = getIt<Dio>();
    final dio2 = getIt<Dio>();
    expect(dio1, same(dio2));

    final apiService1 = getIt<ApiService>();
    final apiService2 = getIt<ApiService>();
    expect(apiService1, same(apiService2));

    final categoryService1 = getIt<CategoryService>();
    final categoryService2 = getIt<CategoryService>();
    expect(categoryService1, same(categoryService2));

    final productService1 = getIt<ProductService>();
    final productService2 = getIt<ProductService>();
    expect(productService1, same(productService2));
  });

  test('should create new instances for factory dependencies', () {
    // Executa a configuração do GetIt
    setupLocator();

    // Verifica se as instâncias de factory são diferentes
    final categoryController1 = getIt<CategoryController>();
    final categoryController2 = getIt<CategoryController>();
    expect(categoryController1, isNot(same(categoryController2)));

    final productController1 = getIt<ProductController>();
    final productController2 = getIt<ProductController>();
    expect(productController1, isNot(same(productController2)));

    final categoryCubit1 = getIt<CategoryCubit>();
    final categoryCubit2 = getIt<CategoryCubit>();
    expect(categoryCubit1, isNot(same(categoryCubit2)));

    final productCubit1 = getIt<ProductCubit>();
    final productCubit2 = getIt<ProductCubit>();
    expect(productCubit1, isNot(same(productCubit2)));
  });
}
