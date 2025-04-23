import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final Color? fieldColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Widget? safixIcon;
  final Function(String)? onChanged, onVisibilityTap;
  final FormFieldValidator<String>? validate;
  const CustomTextField(
      {super.key,
      this.textStyle,
      this.borderColor,
      this.obscureText = false,
      this.controller,
      this.fieldColor,
      this.hintText,
      this.onChanged,
      this.validate,
      this.onVisibilityTap,
      this.prefixIcon,
      this.safixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validate,
      decoration: InputDecoration(
        labelText: hintText,
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
