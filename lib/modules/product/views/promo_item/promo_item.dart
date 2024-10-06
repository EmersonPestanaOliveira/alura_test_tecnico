import 'package:technical_project/core/imports_core.dart';

class PromoItem extends StatelessWidget with PromoItemMixin {
  final String title;
  final String imagePath;
  final double price;

  const PromoItem({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double containerHeight = mediaQuery.size.height * PromoItemMixin.containerHeightRatio;
    final double containerWidth = mediaQuery.size.width * PromoItemMixin.containerWidthRatio;
    final double paddingHorizontal = mediaQuery.size.width * PromoItemMixin.multiplierHorizontal;
    final double paddingVertical = mediaQuery.size.height * PromoItemMixin.multiplierVertical;

    return GestureDetector(
      onTap: () => _navigateToProductScreen(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        child: _buildContainer(context, containerHeight, containerWidth),
      ),
    );
  }

  void _navigateToProductScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          name: title,
          imagePath: imagePath,
          price: price,
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(context),
          _buildTitleAndPrice(context),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: AppColors.surface, 
      borderRadius: BorderRadius.circular(PromoItemMixin.rounding),
      boxShadow: const [
        BoxShadow(
          color: AppColors.textHint, 
          spreadRadius: PromoItemMixin.shadowSpreadRadius,
          blurRadius: PromoItemMixin.shadowBlurRadius,
          offset: PromoItemMixin.shadowOffset,
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * PromoItemMixin.imageHeightimagem;
    return SizedBox(
      height: imageHeight,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PromoItemMixin.rounding),
          topRight: Radius.circular(PromoItemMixin.rounding),
        ),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              PromoItemMixin.placeHolderAsset,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitleAndPrice(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double padding = mediaQuery.size.width * PromoItemMixin.titleAndPricePadding;
    final double spacing = mediaQuery.size.height * PromoItemMixin.titleAndPriceSpacing;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(height: spacing),
          _buildPrice(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h6.copyWith(color: AppColors.accent), 
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Text(
      price.toStringAsFixed(2).replaceAll('.', ','), 
      style: AppTextStyles.h6.copyWith(color: AppColors.accent), 
    );
  }
}
