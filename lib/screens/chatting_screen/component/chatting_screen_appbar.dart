import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChattingScreenAppbar extends StatelessWidget {
  final String? name;
  const ChattingScreenAppbar({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blueEC,
      leading: Padding(
        padding: const EdgeInsets.all(12.0).copyWith(left: 20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const LoadingImage(
            image: AppIcons.backArrowIcon,
            width: 16,
            height: 10,
            color: AppColors.black,
            boxfit: BoxFit.fitWidth,
          ),
        ),
      ),
      title:  ListTile(
        leading:const CircularProfileImage(
          image: AppImages.profileImage,
          height: 34,
          width: 34,
        ),
        title: CustomText(
          text: name??"",
          style: AppTextStyles.black15w700,
        ),
        subtitle: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingImage(
              image: AppIcons.greenOnlineIcon,
            ),
            SizedBox(
              width: 5,
            ),
            CustomText(
              text: 'FitBot',
              style: AppTextStyles.black14w500,
            ),
          ],
        ),
      ),
      actions: const [
        LoadingImage(
          image: AppIcons.phoneCallIcon,
        ),
        SizedBox(
          width: 10,
        ),
        LoadingImage(
          image: AppIcons.videoCallIcon,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
