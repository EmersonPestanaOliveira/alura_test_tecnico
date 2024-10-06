import 'package:technical_project/core/imports_core.dart';

class BlocProviders {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider(
        create: (context) => getIt<ProductCubit>()..fetchProducts(),
      ),
      BlocProvider(
        create: (context) => getIt<CategoryCubit>()..fetchCategories(),
      ),
    ];
  }
}
