import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CreatePostAppbar extends StatelessWidget {
  const CreatePostAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.blueEC,
      elevation: 0,
      title: const CustomText(
        text: 'Create Idea',
        style: AppTextStyles.black18w700,
      ),
      centerTitle: true,
    );
  }
}
