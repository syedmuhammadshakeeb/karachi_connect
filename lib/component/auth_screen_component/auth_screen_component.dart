import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';
import 'package:karachi_connect/component/button_with_icon/button_with_icon.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AuthScreenComponent extends StatelessWidget {
  final String? welcomText,
      descripText,
      loginText,
      haveAcoountOrNot,
      signText,
      forgetPasswordText,
      otherLoginText,
      loginWithGoogleText,
      loginWithFbText;
  final bool? isSignInAuth;
  final List<bool>? obscureText;
  final List<TextEditingController>? controllers;
  final TextEditingController? ntnController;
  final List<String>? credentialText;
  final List<Widget>? prefixicon;
  final List<Widget>? suffixIcon;
  final Function()? signinTap,
      onVisisbiltTap,
      authTap,
      onforgetPasswordTap,
      onDocumentTap;
  const AuthScreenComponent(
      {super.key,
      this.onVisisbiltTap,
      this.ntnController,
      this.obscureText,
      this.welcomText,
      this.onforgetPasswordTap,
      this.signText,
      this.haveAcoountOrNot,
      this.onDocumentTap,
      this.controllers,
      this.signinTap,
      this.authTap,
      this.loginWithFbText,
      this.suffixIcon,
      this.prefixicon,
      this.credentialText,
      this.loginText,
      this.descripText,
      this.forgetPasswordText,
      this.isSignInAuth,
      this.otherLoginText,
      this.loginWithGoogleText});

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
          child: isSignInAuth == true
              ? signInAuthWidget(context)
              : uploadDocumentWidget(context)),
    );
  }

  Widget? signInAuthWidget(context) {
    return ListView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
      children: [
        const AppName(),
        const SizedBox(
          height: 40,
        ),
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
                    controller: controllers?[index] ?? TextEditingController(),
                    obscureText: obscureText?[index] ?? false,
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
            onTap: authTap,
            color: AppColors.darkblue,
            width: MediaQuery.of(context).size.width,
            text: loginText ?? '',
            textStyle: AppTextStyles.white16w500,
            verticalPadding: 10,
          )
        ],
        if (forgetPasswordText?.isNotEmpty == true &&
            forgetPasswordText != null) ...[
          InkWell(
            onTap: onforgetPasswordTap,
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                text: forgetPasswordText ?? '',
                style: AppTextStyles.black16w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
        if (otherLoginText?.isNotEmpty == true && otherLoginText != null) ...[
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(
                    text: otherLoginText ?? '',
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
        ],
        if (loginWithGoogleText?.isNotEmpty == true &&
            loginWithGoogleText != null) ...[
          ButtonWithIcon(
            color: AppColors.transparent,
            bordercolor: AppColors.greyb4,
            iconText: AppIcons.googleIcon,
            text: loginWithGoogleText ?? '',
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: signinTap,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: haveAcoountOrNot,
                      style: AppTextStyles.grey6516w600,
                      children: [
                    TextSpan(
                      text: signText,
                      style: AppTextStyles.blue16w600,
                    )
                  ])),
            ),
          ),
        ],
      ],
    );
  }

  Widget? uploadDocumentWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.4),
        children: [
          const AppName(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.14,
          ),
          const CustomText(
            text:
                'To proceed as an Investor, please upload your annual income transcript for verification',
            style: AppTextStyles.black16w500,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: onDocumentTap,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width - 80,
                child: DottedBorder(
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    dashPattern: const [6, 8],
                    radius: const Radius.circular(15),
                    color: AppColors.darkblue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LoadingImage(
                            image: AppIcons.uploadIcon,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: 'Drag your file(s) or',
                                  style: AppTextStyles.grey6514w500,
                                  children: [
                                TextSpan(
                                    text: ' browse',
                                    style: AppTextStyles.blue14w500)
                              ])),
                          const SizedBox(
                            height: 5,
                          ),
                          const CustomText(
                            text:
                                'Only support .jpg, .png and .svg and zip files',
                            style: AppTextStyles.grey6514w500,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey4d),
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: const ListTile(
                leading: LoadingImage(
                  image: AppIcons.uploadIcon,
                  boxfit: BoxFit.fill,
                ),
                title: CustomText(
                  text: 'folder.zip',
                  style: AppTextStyles.black14w600,
                ),
                subtitle: CustomText(
                  text: '2.5 MB',
                  style: AppTextStyles.grey14w500,
                ),
                trailing: LoadingImage(
                  image: AppIcons.cancelIcon,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            
            borderColor: AppColors.grey4d,
            controller: ntnController,
            prefixIcon: const Icon(Icons.note),
            hintText: 'Enter NTN No.',
          ),
        ],
      ),
    );
  }
}
