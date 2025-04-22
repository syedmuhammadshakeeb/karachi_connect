import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AppName extends StatelessWidget {
  final Color? color;
  const AppName({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.splashSearchIcon),
        const SizedBox(
          width: 10,
        ),
        RichText(
            text: const TextSpan(
                text: 'I',
                style: AppTextStyles.appNameblack,
                children: [
              TextSpan(
                text: 'N',
                style: AppTextStyles.appNameBlue,
              ),
              TextSpan(
                text: 'NOVATE',
                style: AppTextStyles.appNameblack,
              ),
              TextSpan(
                text: ' HUB',
                style: AppTextStyles.appNameBlue,
              )
            ])),
      ],
    );
  }
}
