import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? safixIcon;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validate;
  const CustomTextField({super.key, this.controller, this.hintText, this.onChanged, this.validate, this.prefixIcon, this.safixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon:safixIcon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      
    );
  }
}
