import 'package:technical_project/core/imports_core.dart';

class HomePage extends StatelessWidget with HomePageMixin {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _promosSectionKey = GlobalKey();

  HomePage({Key? key}) : super(key: key);

  void _onSearchChanged(BuildContext context) {
    final query = _searchController.text.trim();
    final productsCubit = context.read<ProductCubit>();

    if (query.isNotEmpty) {
      productsCubit.filterProducts(query);
    }
  }

  void _scrollToPromosSection() {
    final context = _promosSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: HomePageMixin.scrollDuration),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _searchController.addListener(() => _onSearchChanged(context));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(context),
        drawer: const CustomDrawer(),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(HomePageMixin.appBarPadding),
            child: IconButton(
              icon: const Icon(
                Icons.menu_outlined,
                size: HomePageMixin.iconSizeMenu,
              ),
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  FocusScope.of(context).unfocus();
                });
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          );
        },
      ),
      title: Center(
        child: SvgPicture.asset(
          HomePageMixin.logoPath,
          height: HomePageMixin.logoSize,
          width: HomePageMixin.logoSize,
        ),
      ),
      actions: [
        _buildAppBarIcon('assets/icons/general/perfil.svg'),
        _buildAppBarIcon('assets/icons/general/car.svg'),
        const SizedBox(width: HomePageMixin.paddingHorizontal),
      ],
    );
  }

  Widget _buildAppBarIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HomePageMixin.appBarIconPadding),
      child: SvgPicture.asset(
        assetPath,
        height: HomePageMixin.iconSize,
        width: HomePageMixin.iconSize,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _buildSearchField(),
          _buildProductList(context),
          _buildBanner(context),
          _buildPromoBanner(context),
          const CategoriesSection(),
          PromosSection(key: _promosSectionKey),
          const DiscountSection(),
          const InfosSection(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: HomePageMixin.paddingHorizontal,
        vertical: HomePageMixin.paddingVertical,
      ),
      child: TextField(
        focusNode: _searchFocusNode,
        controller: _searchController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: HomePageMixin.searchHint,
          hintStyle: AppTextStyles.bodyRegular,
          fillColor: AppColors.surface,
          filled: true,
          suffixIcon: const Icon(Icons.search_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(HomePageMixin.standardBorderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (_searchController.text.trim().isEmpty) {
          return const SizedBox.shrink();
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null) {
          return Center(child: Text('${ApiErrorsMenssage.erro} ${state.errorMessage}'));
        }
        if (state.products.isEmpty) {
          return const Center(child: Text(ApiErrorsMenssage.noProductsFound));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price}'),
              leading: Image.network(product.imagePath),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      name: product.name,
                      imagePath: product.imagePath,
                      price: product.price,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      color: AppColors.accent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: HomePageMixin.paddingHorizontal,
          vertical: HomePageMixin.paddingVertical,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * HomePageMixin.bannerHeightRatio,
          child: Image.asset(HomePageMixin.bannerImagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * HomePageMixin.promoBannerHeightRatio,
          width: MediaQuery.of(context).size.width,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              AppColors.accentSecundary,
              BlendMode.darken,
            ),
            child: SvgPicture.asset(HomePageMixin.promoBannerBackgroundPath, fit: BoxFit.cover),
          ),
        ),
        _buildPromoText(),
      ],
    );
  }

  Widget _buildPromoText() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double verticalSpacing = HomePageMixin.promoTextVerticalSpacing;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * HomePageMixin.promoTextHorizontalPaddingRatio),
              child: Column(
                children: [
                  Text(
                    HomePageMixin.promoTextMain,
                    style: AppTextStyles.h3.copyWith(color: AppColors.secondaryVariant)
                  ),
                  SizedBox(height: verticalSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        HomePageMixin.promoTextSecondaryStart,
                        style: AppTextStyles.h3.copyWith(color: AppColors.secondaryVariant)
                      ),
                      Text(
                        HomePageMixin.promoTextSecondaryMiddle,
                        style: AppTextStyles.h3.copyWith(color: AppColors.secondary)
                      ),
                    ],
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    HomePageMixin.promoTextFinal,
                    style: AppTextStyles.h3.copyWith(color: AppColors.secondary)
                  ),
                ],
              ),
            ),
            SizedBox(height: verticalSpacing * HomePageMixin.verticalSpacing),
            _buildPromoButton(),
          ],
        );
      },
    );
  }

  Widget _buildPromoButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: HomePageMixin.promoButtonPaddingVertical),
      child: Center(
        child: ElevatedButton(
          onPressed: _scrollToPromosSection,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(HomePageMixin.promoButtonBorderRadius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: HomePageMixin.promoButtonPaddingHorizontal, vertical: HomePageMixin.verticalPadding),
          ),
          child:  Text(
            HomePageMixin.promoButtonText,
            style: AppTextStyles.bodyLargeBold.copyWith(color: AppColors.background)
          ),
        ),
      ),
    );
  }
}
