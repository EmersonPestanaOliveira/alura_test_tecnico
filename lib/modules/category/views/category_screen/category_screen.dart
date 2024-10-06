import 'package:technical_project/core/imports_core.dart';

class CategoryScreen extends StatelessWidget with CategoryScreenMixin {
  final int idCategoria;

  const CategoryScreen({Key? key, required this.idCategoria}) : super(key: key);

  void _onSearchChanged(BuildContext context, String query) {
    final productsCubit = context.read<ProductCubit>();
    productsCubit.filterProductsByNameAndId(nameQuery: query, id: idCategoria);
  }

  void _onInit(BuildContext context) {
    final productsCubit = context.read<ProductCubit>();
    productsCubit.filterProductsById(idCategoria);
  }

  @override
  Widget build(BuildContext context) {
    final FocusNode searchFocusNode = FocusNode();
    final TextEditingController searchController = TextEditingController();

    searchController.addListener(() => _onSearchChanged(context, searchController.text));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onInit(context);
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchField(searchFocusNode, searchController),
              _buildFilteredProducts(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Center(
        child: SvgPicture.asset(
          CategoryScreenMixin.urlLogo,
          height: CategoryScreenMixin.logoSize,
          width: CategoryScreenMixin.logoSize,
        ),
      ),
      actions: [
        _buildAppBarIcon(CategoryScreenMixin.urlPerfil),
        _buildAppBarIcon(CategoryScreenMixin.urlCar),
        const SizedBox(width: CategoryScreenMixin.paddingHorizontal),
      ],
    );
  }

  Widget _buildAppBarIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CategoryScreenMixin.paddingHorizontal),
      child: SvgPicture.asset(
        assetPath,
        height: CategoryScreenMixin.appBarIconSize,
        width: CategoryScreenMixin.appBarIconSize,
      ),
    );
  }

  Widget _buildSearchField(FocusNode focusNode, TextEditingController controller) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: CategoryScreenMixin.paddingHorizontal,
        vertical: CategoryScreenMixin.paddingVertical,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: CategoryScreenMixin.searchHintText,
          hintStyle: AppTextStyles.bodyRegular.copyWith(
            color: AppColors.accent,
            fontFamily: CategoryScreenMixin.fontFamilyPoppins,
          ),
          fillColor: AppColors.surface,
          filled: true,
          suffixIcon: const Icon(Icons.search_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CategoryScreenMixin.borderRadiusCircular),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildFilteredProducts(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return Center(child: Text('Erro: ${state.errorMessage}'));
        }

        if (state.products.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado.'));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return PromoItem(
              title: product.name,
              imagePath: product.imagePath,
              price: product.price,
            );
          },
        );
      },
    );
  }
}