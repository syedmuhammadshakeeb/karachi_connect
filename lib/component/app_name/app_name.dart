import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AppName extends StatelessWidget {
  final Color? color;
  final bool appIcon;
  final double? fontSize;
  const AppName({super.key, this.color, this.fontSize, this.appIcon = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (appIcon == true) ...[
          SvgPicture.asset(AppIcons.splashSearchIcon),
          const SizedBox(
            width: 10,
          ),
        ],
        RichText(
            text: TextSpan(
                text: 'I',
                style: AppTextStyles.appNameblack
                    .copyWith(fontSize: fontSize ?? null),
                children: [
              TextSpan(
                text: 'N',
                style: AppTextStyles.appNameBlue
                    .copyWith(fontSize: fontSize ?? null),
              ),
              TextSpan(
                text: 'NOVATE',
                style: AppTextStyles.appNameblack
                    .copyWith(fontSize: fontSize ?? null),
              ),
              TextSpan(
                text: ' HUB',
                style: AppTextStyles.appNameBlue
                    .copyWith(fontSize: fontSize ?? null),
              )
            ])),
      ],
    );
  }
}
