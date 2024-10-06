class CategoryUtils {
  static int getCategoryId(String category, Map<String, int> categoryIds) {
    return categoryIds[category.toLowerCase()] ?? 0; 
  }
}
