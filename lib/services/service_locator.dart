import 'package:technical_project/core/imports_core.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<CategoryService>(() => CategoryService(getIt<ApiService>()));
  getIt.registerLazySingleton<ProductService>(() => ProductService(getIt<ApiService>()));

  // Register Controllers
  getIt.registerFactory<CategoryController>(() => CategoryController(getIt<CategoryService>()));
  getIt.registerFactory<ProductController>(() => ProductController(getIt<ProductService>()));

  // Register Cubits
  getIt.registerFactory(() => CategoryCubit(getIt<CategoryController>()));
  getIt.registerFactory(() => ProductCubit(getIt<ProductController>()));
}
