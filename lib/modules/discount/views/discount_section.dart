import 'package:technical_project/core/imports_core.dart';

class DiscountSection extends StatelessWidget with DiscountSectionMixin {
  const DiscountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(
        vertical: DiscountSectionMixin.paddingVertical,
        horizontal: DiscountSectionMixin.paddingHorizontal,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: DiscountSectionMixin.spacingBetweenTitleAndDescription),
          _buildDescription(),
          const SizedBox(height: DiscountSectionMixin.spacingBetweenDescriptionAndInput),
          _buildEmailInput(),
          const SizedBox(height: DiscountSectionMixin.spacingBetweenInputAndButton),
          _buildSubscribeButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      DiscountSectionMixin.titleText,
      style: AppTextStyles.h6Small.copyWith(
        color: AppColors.accent,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription() {
    return Text(
      DiscountSectionMixin.descriptionText,
      style: AppTextStyles.bodyRegular.copyWith(
        color: AppColors.accent,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: DiscountSectionMixin.inputHintText,
        hintStyle: AppTextStyles.bodySmallRegular.copyWith(
          color: AppColors.accent,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DiscountSectionMixin.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.textPrimary,
            width: DiscountSectionMixin.inputBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DiscountSectionMixin.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.textPrimary,
            width: DiscountSectionMixin.inputBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DiscountSectionMixin.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.textPrimary,
            width: DiscountSectionMixin.inputBorderWidth,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DiscountSectionMixin.inputPaddingHorizontal,
          vertical: DiscountSectionMixin.inputPaddingVertical,
        ),
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return ElevatedButton(
      onPressed: _onSubscribePressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DiscountSectionMixin.buttonBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DiscountSectionMixin.buttonPaddingHorizontal,
          vertical: DiscountSectionMixin.buttonPaddingVertical,
        ),
      ),
      child: Text(
        DiscountSectionMixin.buttonText,
        style: AppTextStyles.bodyLargeBold.copyWith(
          color: AppColors.background,
        ),
      ),
    );
  }

  void _onSubscribePressed() {
  }
}
