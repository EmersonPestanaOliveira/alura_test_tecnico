import 'package:technical_project/core/imports_core.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryController _categoryController;

  CategoryCubit(this._categoryController)
      : super(CategoryState(
          categories: const [],
          isLoading: false,
          errorMessage: null,
        ));

  /// Método para buscar todas as categorias e preencher o estado
  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final categories = await _categoryController.fetchCategories();
      emit(state.copyWith(
        categories: categories,
        isLoading: false,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: '${ApiErrorsMenssage.errorLoadingCategories} ${e.toString()}',
      ));
    }
  }
}