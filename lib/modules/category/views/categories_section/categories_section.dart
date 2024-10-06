import 'package:technical_project/core/imports_core.dart';

class CategoriesSection extends StatelessWidget with CategoriesSectionMixin {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: CategoriesSectionMixin.sectionSpacing),
        _buildTitle(),
        const SizedBox(height: CategoriesSectionMixin.smallSpacing),
        _buildDescription(),
        const SizedBox(height: CategoriesSectionMixin.sectionSpacing),
        _buildCategoryList(context),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      CategoriesSectionMixin.titleText,
      style: AppTextStyles.h6.copyWith(
        color: AppColors.accent,
        fontSize: CategoriesSectionMixin.titleFontSize,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: CategoriesSectionMixin.sectionPadding,
      child: Text(
        CategoriesSectionMixin.descriptionText,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyRegular.copyWith(
          color: AppColors.textPrimary,
          fontSize: CategoriesSectionMixin.descriptionFontSize,
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.errorMessage != null) {
          return const Center(child: Text(CategoriesSectionMixin.errorText));
        } else if (state.categories.isEmpty) {
          return const Center(child: Text(CategoriesSectionMixin.noCategoriesText));
        }

        return Column(
          children: state.categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(bottom: CategoriesSectionMixin.categoryItemSpacing),
              child: CategoryItem(
                title: category.name,
                imagePath: category.imagePath,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}