import 'package:flutter/material.dart';

import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class PostSucessfulDialog {
  static void showPostSucessfulDialog(BuildContext context,
      {Function()? onCancelTap}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const LoadingImage(
                  image: AppIcons.sucessTickIcon,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(
                      text: "Post created successfully",
                      style: AppTextStyles.blue18w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(
                      text: "Thank you for your request.",
                      style: AppTextStyles.black14w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: CustomButton(
                    onTap: onCancelTap,
                    bordercolor: AppColors.darkblue,
                    color: AppColors.darkblue,
                    horizontalPadding: 20,
                    text: 'Cancel',
                    textStyle: AppTextStyles.white16w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
}
