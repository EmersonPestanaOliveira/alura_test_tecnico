import 'package:technical_project/core/imports_core.dart';

class PromosSection extends StatelessWidget with PromosSectionMixin {
  const PromosSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: PromosSectionMixin.promoItemSpacing),
        _buildSectionTitle(),
        const SizedBox(height: PromosSectionMixin.promoItemSpacing),
        _buildProductList(context),
        const SizedBox(height: PromosSectionMixin.topPadding),
      ],
    );
  }

  Widget _buildSectionTitle() {
    return const Text(
      PromosSectionMixin.promoTitle,
      style: AppTextStyles.h6, 
    );
  }

  Widget _buildProductList(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.errorMessage != null) {
          return Center(child: Text('${ApiErrorsMenssage.erro} ${state.errorMessage}'));
        } else if (state.allProducts.isEmpty) {
          return const Center(child: Text(ApiErrorsMenssage.errorProductEmpy),);
        }

        final displayedProducts = state.products;
        final hasMoreItems = !context.read<ProductCubit>().allItemsDisplayed();

        return Column(
          children: [
            Column(
              children: displayedProducts.map((product) {
                return Column(
                  children: [
                    PromoItem(
                      title: product.name,
                      imagePath: product.imagePath,
                      price: product.price,
                    ),
                    const SizedBox(height: PromosSectionMixin.promoItemSpacing),
                  ],
                );
              }).toList(),
            ),
            if (hasMoreItems) _buildSeeMore(context),
          ],
        );
      },
    );
  }

  Widget _buildSeeMore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PromosSectionMixin.sectionPadding),
      child: GestureDetector(
        onTap: () => _onSeeMoreTap(context),
        child: Text(
          PromosSectionMixin.seeMore,
          style: AppTextStyles.bodyLargeBold.copyWith(
            color: AppColors.primary, 
            decoration: TextDecoration.underline, 
          ),
        ),
      ),
    );
  }

  void _onSeeMoreTap(BuildContext context) {
    context.read<ProductCubit>().increaseItemsToShow();
  }
}
