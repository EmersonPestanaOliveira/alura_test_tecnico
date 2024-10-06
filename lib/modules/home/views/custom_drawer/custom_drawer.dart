import 'package:technical_project/core/imports_core.dart';

class CustomDrawer extends StatelessWidget with CustomDrawerMixin {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildUserAccountHeader(),
          _buildDrawerCategoryItem(context, CustomDrawerMixin.category1Title, CustomDrawerMixin.category1ImagePath, CustomDrawerMixin.category1Id),
          _buildDrawerCategoryItem(context, CustomDrawerMixin.category2Title, CustomDrawerMixin.category2ImagePath, CustomDrawerMixin.category2Id),
          _buildDrawerCategoryItem(context, CustomDrawerMixin.category3Title, CustomDrawerMixin.category3ImagePath, CustomDrawerMixin.category3Id),
          const InfosSection(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildUserAccountHeader() {
    return  UserAccountsDrawerHeader(
      accountName: Text(
        CustomDrawerMixin.accountName,
        style: AppTextStyles.h6Small.copyWith(color:AppColors.background), 
      ),
      accountEmail: Text(
        CustomDrawerMixin.accountEmail,
        style: AppTextStyles.h6Small.copyWith(color:AppColors.background), 
      ),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage(CustomDrawerMixin.userImagePath),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomDrawerMixin.backgroundHeaderImagePath),
          fit: BoxFit.cover,
        ),
        color: AppColors.primary,
      ),
    );
  }

  ListTile _buildDrawerCategoryItem(
    BuildContext context,
    String title,
    String imagePath,
    int categoryId,
  ) {
    return ListTile(
      leading: _buildDrawerCategoryImage(imagePath),
      title: Text(
        title,
        style: AppTextStyles.bodyLargeBold, 
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(idCategoria: categoryId)),
        );
      },
    );
  }

  Widget _buildDrawerCategoryImage(String imagePath) {
    return Container(
      width: CustomDrawerMixin.drawerIconWidth,
      height: CustomDrawerMixin.drawerIconHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomDrawerMixin.userImageBorderRadius),
        boxShadow: [
          BoxShadow(
            color: CustomDrawerMixin.drawerIconShadowColor.withOpacity(CustomDrawerMixin.drawerIconShadowOpacity),
            spreadRadius: CustomDrawerMixin.userImageShadowSpreadRadius,
            blurRadius: CustomDrawerMixin.userImageShadowBlurRadius,
            offset: const Offset(0, CustomDrawerMixin.userImageShadowOffsetY),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CustomDrawerMixin.userImageBorderRadius),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
