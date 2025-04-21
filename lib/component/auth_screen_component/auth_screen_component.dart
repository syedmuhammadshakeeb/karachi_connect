import 'package:flutter/material.dart';
import 'package:karachi_connect/component/button_with_icon/button_with_icon.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AuthScreenComponent extends StatelessWidget {
  final String? mainText,
      welcomText,
      descripText,
      loginText,
      forgetPasswordText,
      otherLoginText,
      loginWithPhoneText;
  final bool? isSignInAuth;
  final List<String>? credentialText;
  final List<Widget>? prefixicon;
  final List<Widget>? suffixIcon;
  const AuthScreenComponent(
      {super.key,
      this.mainText,
      this.welcomText,
      this.suffixIcon,
      this.prefixicon,
      this.credentialText,
      this.loginText,
      this.descripText,
      this.forgetPasswordText,
      this.isSignInAuth,
      this.otherLoginText,
      this.loginWithPhoneText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.darkblue,
          AppColors.lightblue,
        ]),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (mainText?.isNotEmpty == true && mainText != null) ...[
              CustomText(
                text: mainText ?? '',
                style: AppTextStyles.white32w800,
              )
            ],
            const SizedBox(
              height: 40,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: AppColors.blue8f,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: isSignInAuth == true
                          ? signInAuthWidget(context)
                          : const SizedBox.shrink()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget? signInAuthWidget(context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        if (welcomText?.isNotEmpty == true && welcomText != null) ...[
          CustomText(text: welcomText ?? '', style: AppTextStyles.black28w600),
          const SizedBox(
            height: 5,
          )
        ],
        if (descripText?.isNotEmpty == true && descripText != null) ...[
          CustomText(
            text: descripText ?? "",
            style: AppTextStyles.black14w500,
          ),
          const SizedBox(
            height: 20,
          )
        ],
        if (credentialText?.isNotEmpty == true && credentialText != null) ...[
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: credentialText?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextField(
                    prefixIcon: prefixicon?[index] ?? const SizedBox.shrink(),
                    safixIcon: suffixIcon?[index] ?? const SizedBox.shrink(),
                    hintText: credentialText?[index] ?? '',
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          )
        ],
        if (loginText?.isNotEmpty == true && loginText != null) ...[
          CustomButton(
            width: MediaQuery.of(context).size.width,
            text: loginText ?? '',
            textStyle: AppTextStyles.white16w500,
            verticalPadding: 10,
          )
        ],
        if (forgetPasswordText?.isNotEmpty == true &&
            forgetPasswordText != null) ...[
          CustomText(
            text: forgetPasswordText ?? '',
            style: AppTextStyles.black16w500,
          ),
          const SizedBox(
            height: 20,
          )
        ],
        if (otherLoginText?.isNotEmpty == true && otherLoginText != null) ...[
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: const Divider(
                  color: AppColors.greyb4,
                  thickness: 1,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(
                    text: otherLoginText ?? '',
                    style: AppTextStyles.grey14w500),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: const Divider(
                  color: AppColors.greyb4,
                  thickness: 1,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        if (loginWithPhoneText?.isNotEmpty == true &&
            loginWithPhoneText != null) ...[
          Align(
            alignment: Alignment.center,
            child: ButtonWithIcon(
              color: AppColors.transparent,
              bordercolor: AppColors.greyb4,
              icon: Icons.phone,
              text: loginWithPhoneText ?? '',
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ],
    );
  }

  Widget? uploadDocumentWidget(context) {
    return const Column(
      children: [
        
      ],
    );
  }
}
