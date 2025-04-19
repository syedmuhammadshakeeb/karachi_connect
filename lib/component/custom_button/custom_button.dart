import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.color,
      this.text,
      this.textStyle,
      this.verticalPadding,
      this.width,
      this.horizontalPadding});
  final Color? color;
  final String? text;
  final TextStyle? textStyle;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width:width?? MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? AppColors.transparent,
      ),
      child: Center(
        child: CustomText(text: text ?? '', style: textStyle),
      ),
    );
  }
}
