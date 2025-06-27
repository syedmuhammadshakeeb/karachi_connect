import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

import '../text/custom_text.dart';

showSnackBar(
  BuildContext context,
  String message, {
  bool isSuccess = false,
  bool isCancel = false,
  num? duration,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 0,

        behavior: SnackBarBehavior.floating,

        duration: Duration(milliseconds: ((duration ?? 2) * 1000).toInt()),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: isSuccess ? AppColors.blue07 : AppColors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        backgroundColor:
            // ThemeState.isDarkMode(context)
            //     ? AppColors.kBlack1E
            //     // AppColors.kBlack44
            //     :
            (isSuccess
                ? const Color(0xffF5FBFB) // .fromRGBO(135, 211, 209, 0.08)
                : Colors.red // .fromRGBO(251, 199, 132, 0.25)
            ), // .fromRGBO(251, 165, 141, 0.25),
        content: CustomText(
          text: message.replaceAll('-', ' '),
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: AppTextStyles.black12w400.copyWith(
            fontSize: 14,
            color:
                //  ThemeState.isDarkMode(context)
                //     ?
                (isSuccess ? AppColors.black : AppColors.white),

            // : AppColors.kGrey
          ),
        ),
      ),
    );
}
