import 'package:flutter/material.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';
import 'package:karachi_connect/component/button_with_icon/button_with_icon.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class LoginUi extends StatelessWidget {
  final Function()? onLoginTap;
  final Function()? onForgetPasswordTap;
  final Function()? onsignupNavigationTap;
  final Function()? ongoogleTap;
  final Function()? obsecureTap;
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final bool? obsecure;
  final TextEditingController? passwordControllers;
  final TextEditingController? emailControllers;

  const LoginUi(
      {super.key,
      this.onForgetPasswordTap,
      this.onLoginTap,
      this.onsignupNavigationTap,
      this.emailControllers,
      this.passwordControllers,
      this.obsecureTap,
      this.obsecure,
      this.ongoogleTap,
      this.emailValidator,
      this.passwordValidator});

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
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
            children: [
              const AppName(),
              const SizedBox(
                height: 40,
              ),

              // ListView.builder(
              //     padding: EdgeInsets.zero,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: credentialText?.length,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(bottom: 10.0),
              //         child: CustomTextField(
              //           controller:
              //               controllers?[index] ?? TextEditingController(),
              //           obscureText: obscureText?[index] ?? false,
              //           prefixIcon:
              //               prefixicon?[index] ?? const SizedBox.shrink(),
              //           safixIcon:
              //               suffixIcon?[index] ?? const SizedBox.shrink(),
              //           hintText: credentialText?[index] ?? '',
              //         ),
              //       );
              //     }),

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
                onTap: onLoginTap,
                color: AppColors.darkblue,
                width: MediaQuery.of(context).size.width,
                text: 'Login',
                textStyle: AppTextStyles.white16w500,
                verticalPadding: 10,
              ),
              InkWell(
                onTap: onForgetPasswordTap,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'Forgot Password?',
                    style: AppTextStyles.black16w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Divider(
                      color: AppColors.grey65,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(
                        text: 'Or sign in with',
                        style: AppTextStyles.grey6514w500),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Divider(
                      color: AppColors.grey65,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              ButtonWithIcon(
                onTap: ongoogleTap,
                color: AppColors.transparent,
                bordercolor: AppColors.greyb4,
                iconText: AppIcons.googleIcon,
                text: 'Sign up with Google',
              ),
              const SizedBox(
                height: 40,
              ),

              InkWell(
                onTap: onsignupNavigationTap,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Don\'t have an account?',
                          style: AppTextStyles.grey6516w600,
                          children: [
                        TextSpan(
                          text: 'Sign up',
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
