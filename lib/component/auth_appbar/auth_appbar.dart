import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AuthAppbar extends StatelessWidget {
  final IconData? leadingIcon;
  final bool dontHaveAccount, getstarted;
  final String? buttonText, haveAccountText;
  final Function()? onTap;
  final Function()? onLeadingIconTap;
  const AuthAppbar(
      {super.key,
      this.onTap,
      this.onLeadingIconTap,
      this.leadingIcon,
      this.dontHaveAccount = false,
      this.getstarted = false,
      this.buttonText,
      this.haveAccountText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      leading: InkWell(
          onTap: onLeadingIconTap,
          child: Icon(leadingIcon, color: AppColors.black, size: 20)),
      actions: [
        if (dontHaveAccount) ...[
          CustomText(
            text: haveAccountText ?? '',
            style: AppTextStyles.white16w500,
          ),
        ],
        const SizedBox(
          width: 10,
        ),
        if (getstarted) ...[
          CustomButton(
            onTap: onTap,
            color: AppColors.white.withValues(alpha: 0.3),
            text: buttonText ?? '',
            textStyle: AppTextStyles.white14w500,
            width: 100,
            verticalPadding: 5,
          )
        ],
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
