import 'dart:io';

import 'package:flutter/material.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class SignUpUi extends StatelessWidget {
  final TextEditingController? nameControllers;
  final TextEditingController? emailControllers;
  final TextEditingController? phoneNoControllers;
  final TextEditingController? passwordControllers;
  final FormFieldValidator<String>? nameValidator;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final GlobalKey<FormFieldState<String>>? passwordKey;
  final FormFieldValidator<String>? phoneValidator;
  final bool? obsecure;
  final Function()? onImageTap;
  final String? passwordError;
  final File? image;
  final Function()? obsecureTap;
  final Function()? onSignUpTap,
      onForgetpasswordTap,
      onGoogleTap,
      loginNavigationTap;

  const SignUpUi(
      {super.key,
      this.nameControllers,
      this.emailControllers,
      this.emailValidator,
      this.passwordKey,
      this.passwordError,
      this.phoneValidator,
      this.passwordValidator,
      this.onImageTap,
      this.phoneNoControllers,
      this.passwordControllers,
      this.nameValidator,
      this.obsecure,
      this.obsecureTap,
      this.loginNavigationTap,
      this.onSignUpTap,
      this.onForgetpasswordTap,
      this.image,
      this.onGoogleTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
            children: [
              const AppName(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: onImageTap,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkblue,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: image != null
                            ? FileImage(
                                image!,
                              )
                            : const AssetImage(AppImages.empty),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: nameControllers,
                prefixIcon: const Icon(Icons.person),
                validate: nameValidator,
                hintText: 'Enter Name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailControllers ?? TextEditingController(),
                prefixIcon: const Icon(Icons.alternate_email_outlined),
                validate: emailValidator,
                hintText: 'Enter Email',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: phoneNoControllers ?? TextEditingController(),
                validate: phoneValidator,
                prefixIcon: const Icon(Icons.phone_outlined),
                hintText: 'Enter Phone no.',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                errorText: passwordError,
                key: passwordKey,
                controller: passwordControllers ?? TextEditingController(),
                obscureText: obsecure ?? false,
                prefixIcon: const Icon(Icons.lock),
                validate: passwordValidator,
                safixIcon: IconButton(
                  icon: obsecure == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: obsecureTap,
                ),
                hintText: 'Enter Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: onSignUpTap,
                color: AppColors.darkblue,
                width: MediaQuery.of(context).size.width,
                text: 'Sign Up',
                textStyle: AppTextStyles.white16w500,
                verticalPadding: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: loginNavigationTap,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Already have an account?',
                          style: AppTextStyles.grey6516w600,
                          children: [
                        TextSpan(
                          text: 'LogIn',
                          style: AppTextStyles.blue16w600,
                        )
                      ])),
                ),
              ),
            ],
          )),
    );
  }
}
