import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AuthAppbar extends StatelessWidget {
  const AuthAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      
      leading:
          const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20),
      actions: [
        const CustomText(
          text: 'Don\'t have an account?',
          style: AppTextStyles.white16w500,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          color: AppColors.white.withValues(alpha: 0.3),
          text: 'Get Started',
          textStyle: AppTextStyles.white14w500,
          width: 100,
          verticalPadding: 5,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
