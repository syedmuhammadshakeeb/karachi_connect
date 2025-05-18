import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class UserBioComponent extends StatelessWidget {
  final String? icon, text;
  final TextStyle textStyle;
  const UserBioComponent(
      {super.key,
      this.icon,
      this.text,
      this.textStyle = AppTextStyles.grey6514w500});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null && icon?.isNotEmpty == true) ...[
          LoadingImage(
            height: 15,
            width: 15,
            image: icon,
          ),
          const SizedBox(
            width: 4,
          )
        ],
        if (text != null && text?.isNotEmpty == true) ...[
          CustomText(
            text: text ?? '',
            style: textStyle,
          )
        ]
      ],
    );
  }
}
