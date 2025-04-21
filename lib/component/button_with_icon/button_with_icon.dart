import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ButtonWithIcon extends StatelessWidget {
  final Color? color;
  final Color? bordercolor;
  final IconData? icon;
  final String? text;
  final double? width;
  const ButtonWithIcon(
      {super.key,
      this.color,
      this.bordercolor,
      this.icon,
      this.text,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color ?? AppColors.transparent,
        border: Border.all(color: bordercolor ?? AppColors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
          ), // Replace with your icon
          const SizedBox(width: 8), // Space between icon and text
          Text(
            text ?? '', // Replace with your button text
            style: AppTextStyles.black14w500, // Customize text style
          ),
        ],
      ),
    );
  }
}
