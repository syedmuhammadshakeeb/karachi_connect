import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? mixLines;
  final String? errorText;
  final Color? fieldColor;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Widget? safixIcon;
  final Function(String)? onChanged;
  final Function(String)? onVisibilityTap;
  final FormFieldValidator<String>? validate;
  const CustomTextField(
      {super.key,
      this.textStyle,
      this.keyboardType,
      this.borderColor,
      this.obscureText = false,
      this.mixLines,
      this.controller,
      this.fieldColor,
      this.hintText,
      this.onChanged,
      this.validate,
      this.onVisibilityTap,
      this.prefixIcon,
      this.errorText,
      this.safixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validate,
      keyboardType: keyboardType,
      maxLines: mixLines ?? 1,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: hintText,
        errorText: errorText,
        errorStyle: AppTextStyles.red12w400,
        labelStyle: textStyle ??
            const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: prefixIcon,
        fillColor: fieldColor ?? AppColors.transparent,
        filled: true,
        suffixIcon: safixIcon,
        hintTextDirection: TextDirection.ltr,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColors.grey65)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColors.grey65)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColors.grey65)),
        hintText: hintText,
        hintStyle: textStyle ?? const TextStyle(color: Colors.grey),
      ),
    );
  }
}
