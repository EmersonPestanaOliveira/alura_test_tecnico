import 'package:technical_project/core/imports_core.dart';

class InfosSection extends StatelessWidget with InfosSectionMixin {
  const InfosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(InfosSectionMixin.paddingAll),
      color: AppColors.accent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(),
          const SizedBox(height: InfosSectionMixin.smallSpacingHeight),
          _buildSlogan(),
          const SizedBox(height: InfosSectionMixin.spacingHeight),
          _buildDivider(),
          const SizedBox(height: InfosSectionMixin.spacingHeight),
          _buildOperatingHours(),
          const SizedBox(height: InfosSectionMixin.spacingHeight),
          _buildPaymentMethods(),
          const SizedBox(height: InfosSectionMixin.spacingHeight),
          _buildSocialMedia(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(InfosSectionMixin.logoPadding),
      child: Center(
        child: SvgPicture.asset(
          InfosSectionMixin.logoUrlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSlogan() {
    return Center(
      child: Text(
        InfosSectionMixin.slogan,
        textAlign: TextAlign.center,
        style: AppTextStyles.h6Small.copyWith(color: AppColors.secondary, fontSize: InfosSectionMixin.sloganfontSize),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColors.secondary,
      thickness: InfosSectionMixin.dividerThickness,
    );
  }

  Widget _buildOperatingHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          InfosSectionMixin.operatingHoursTitle,
          style: AppTextStyles.bodyLargeBold.copyWith(color: AppColors.background),
        ),
        const SizedBox(height: InfosSectionMixin.smallSpacingHeight),
        Text(
          InfosSectionMixin.operatingHoursTime,
          style: AppTextStyles.bodyRegular.copyWith(color: AppColors.background),
        ),
        Text(
          InfosSectionMixin.operatingHoursEmail,
          style: AppTextStyles.bodyRegular.copyWith(color: AppColors.background),
        ),
        Text(
          InfosSectionMixin.operatingHoursPhone,
          style: AppTextStyles.bodyRegular.copyWith(color: AppColors.background),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          InfosSectionMixin.paymentMethodsTitle,
          style: AppTextStyles.bodyLargeBold.copyWith(color: AppColors.background),
        ),
        const SizedBox(height: InfosSectionMixin.spacingHeight),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: InfosSectionMixin.iconSpacingWidth,
          runSpacing: InfosSectionMixin.spacingHeight,
          children: [
            SvgPicture.asset(InfosSectionMixin.visaUrl, width: InfosSectionMixin.paymentIconWidth),
            SvgPicture.asset(InfosSectionMixin.mastercardUrl, width: InfosSectionMixin.paymentIconWidth),
            SvgPicture.asset(InfosSectionMixin.elodUrl, width: InfosSectionMixin.paymentIconWidth),
            SvgPicture.asset(InfosSectionMixin.dinersdUrl, width: InfosSectionMixin.paymentIconWidth),
            SvgPicture.asset(InfosSectionMixin.pixUrl, width: InfosSectionMixin.paymentIconWidth),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          InfosSectionMixin.socialMediaText,
          style: AppTextStyles.bodyLargeBold.copyWith(color: AppColors.background),
        ),
        const SizedBox(height: InfosSectionMixin.spacingHeight),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.whatsapp, color: AppColors.secondaryVariant, size: InfosSectionMixin.iconSize),
            SizedBox(width: InfosSectionMixin.iconSpacingWidth),
            Icon(FontAwesomeIcons.instagram, color: AppColors.secondaryVariant, size: InfosSectionMixin.iconSize),
            SizedBox(width: InfosSectionMixin.iconSpacingWidth),
            Icon(FontAwesomeIcons.tiktok, color: AppColors.secondaryVariant, size: InfosSectionMixin.iconSize),
          ],
        ),
      ],
    );
  }
}
