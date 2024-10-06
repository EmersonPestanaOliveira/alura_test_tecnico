import 'package:flutter_test/flutter_test.dart';
import 'package:technical_project/core/imports_core.dart';

void main() {
  group('CategoryState Tests', () {
    const category1 = Category(
      id: 1,
      name: 'roupas',
      imagePath: 'https://picsum.photos/321/253?random=1',
    );

    const category2 = Category(
      id: 2,
      name: 'decoração',
      imagePath: 'https://picsum.photos/321/253?random=2',
    );

    final List<Category> categoriesList = [category1, category2];

    test('Initial state should have default values', () {
      final state = CategoryState.initial();

      expect(state.categories, []);
      expect(state.isLoading, false);
      expect(state.errorMessage, null);
    });

    test('copyWith should return a new state with updated values', () {
      final initialState = CategoryState.initial();

      final newState = initialState.copyWith(
        categories: categoriesList,
        isLoading: true,
        errorMessage: 'Error occurred',
      );

      expect(newState.categories, categoriesList);
      expect(newState.isLoading, true);
      expect(newState.errorMessage, 'Error occurred');
    });

    test('copyWith should return the same state if no new values are provided', () {
      final initialState = CategoryState.initial();

      final newState = initialState.copyWith();

      expect(newState.categories, initialState.categories);
      expect(newState.isLoading, initialState.isLoading);
      expect(newState.errorMessage, initialState.errorMessage);
    });

    test('hasError should return true if errorMessage is set', () {
      final stateWithError = CategoryState.initial().copyWith(
        errorMessage: 'An error occurred',
      );

      expect(stateWithError.hasError, true);
    });

    test('hasError should return false if errorMessage is null or empty', () {
      final stateWithoutError = CategoryState.initial();
      final stateWithEmptyError = CategoryState.initial().copyWith(
        errorMessage: '',
      );

      expect(stateWithoutError.hasError, false);
      expect(stateWithEmptyError.hasError, false);
    });

    test('props should contain the expected properties', () {
      final state = CategoryState(
        categories: categoriesList,
        isLoading: false,
        errorMessage: null,
      );

      expect(
        state.props,
        [categoriesList, false, null],
      );
    });
  });
}
