import 'package:technical_project/core/imports_core.dart';

class CategoryState extends Equatable {
  final List<Category> categories;
  final bool isLoading;
  final String? errorMessage;

  CategoryState({
    required List<Category> categories,
    required this.isLoading,
    this.errorMessage,
  }) : categories = List.unmodifiable(categories);

  factory CategoryState.initial() {
    return CategoryState(
      categories: const [],
      isLoading: false,
      errorMessage: null,
    );
  }

  CategoryState copyWith({
    List<Category>? categories,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @override
  List<Object?> get props => [categories, isLoading, errorMessage];
}
