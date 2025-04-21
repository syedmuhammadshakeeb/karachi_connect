import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.color,
      this.text,
      this.textStyle,
      this.onTap,
      this.verticalPadding,
      this.width,
      this.horizontalPadding});
  final Color? color;
  final String? text;
  final TextStyle? textStyle;
  final Function()? onTap;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width ?? MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 0),
        decoration: BoxDecoration(
          gradient: color != null
              ? null
              : const LinearGradient(colors: [
                  AppColors.darkblue,
                  AppColors.pinkcc,
                  AppColors.pinkdd,
                ]),
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: CustomText(text: text ?? '', style: textStyle),
        ),
      ),
    );
  }
}
