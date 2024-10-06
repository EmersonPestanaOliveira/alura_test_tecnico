import 'package:technical_project/core/imports_core.dart';

class CategoryItem extends StatelessWidget with CategoryItemMixin {
  final String title;
  final String imagePath;

  const CategoryItem({Key? key, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToCategory(context),
      child: Padding(
        padding: const EdgeInsets.all(CategoryItemMixin.paddingAll),
        child: _buildCategoryContainer(context),
      ),
    );
  }

  Widget _buildCategoryContainer(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * CategoryItemMixin.containerHeightRatio,
      width: screenWidth * CategoryItemMixin.containerWidthRatio,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondary.withOpacity(0.3),
            spreadRadius: CategoryItemMixin.boxShadowSpreadRadius,
            blurRadius: CategoryItemMixin.boxShadowBlurRadius,
            offset: CategoryItemMixin.boxShadowOffset,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCategoryImage(),
          _buildCategoryTitle(),
        ],
      ),
    );
  }

  Widget _buildCategoryImage() {
    return Expanded(
      child: Image.network(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: CategoryItemMixin.errorSize,
            color: AppColors.error,
          );
        },
      ),
    );
  }

  Widget _buildCategoryTitle() {
    return Padding(
      padding: const EdgeInsets.all(CategoryItemMixin.paddingAll),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            _capitalize(title),
            style: AppTextStyles.h5.copyWith(
              color: AppColors.accent,
              fontSize: CategoryItemMixin.titleFontSize,
              fontFamily: CategoryItemMixin.fontFamilyOrbitron,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCategory(BuildContext context) {
    int idCategoria = CategoryUtils.getCategoryId(title, CategoryConstants.categoryIds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryScreen(idCategoria: idCategoria)),
    );
  }

  String _capitalize(String text) {
    return text.isNotEmpty ? '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}' : text;
  }
}