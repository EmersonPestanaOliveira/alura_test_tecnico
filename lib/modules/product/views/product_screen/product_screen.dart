import 'package:technical_project/core/imports_core.dart';

class ProductScreen extends StatelessWidget with ProductScreenMixin {
  final String name;
  final String imagePath;
  final double price;

  const ProductScreen({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,  
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background, 
      centerTitle: true,
      title: Text(name, style: AppTextStyles.h6Small), 
      actions: _buildAppBarActions(),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      _buildSvgIcon(ProductScreenMixin.perfilIconAsset, ProductScreenMixin.appBarActionsPerfil),
      _buildSvgIcon(ProductScreenMixin.carIconAsset,ProductScreenMixin.appBarActionsCar ),
      const SizedBox(width: ProductScreenMixin.appBarActionSpacing),
    ];
  }

  Widget _buildSvgIcon(String assetName, String semanticsLabel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ProductScreenMixin.paddingHorizontal),
      child: SvgPicture.asset(
        assetName,
        height: ProductScreenMixin.iconSize,
        width: ProductScreenMixin.iconSize,
        semanticsLabel: semanticsLabel,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final double imageSectionHeight =
        MediaQuery.of(context).size.height * ProductScreenMixin.imageSectionHeightRatio;

    return Container(
      color: AppColors.background, 
      child: Column(
        children: [
          _buildImageSection(imageSectionHeight),
          _buildPriceSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection(double height) {
    return Container(
      padding: const EdgeInsets.all(ProductScreenMixin.imageSectionPadding),
      height: height,
      child: Image.network(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/placeholder.png',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildPriceSection() {
    return Padding(
      padding: const EdgeInsets.all(ProductScreenMixin.imageSectionPadding),
      child: Column(
        children: [
          Text(name, style: AppTextStyles.h6Small),
          Text(
            'Valor: ${price.toStringAsFixed(2).replaceAll('.', ',')}',
            style: AppTextStyles.h6Small.copyWith(color: AppColors.accent), 
          ),
        ],
      ),
    );
  }
}
