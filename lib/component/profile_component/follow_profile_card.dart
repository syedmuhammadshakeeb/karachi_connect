import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class FollowProfileCard extends StatelessWidget {
  final String? profileName, followers, image;
  final Function()? onTap, onFollowTap;
  const FollowProfileCard(
      {super.key, this.followers, this.image, this.profileName, this.onTap, this.onFollowTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.grey4d,
                  blurRadius: 34,
                  spreadRadius: 0,
                  offset: Offset(0, 0))
            ]),
        child: ListTile(
            leading:const CircularProfileImage(
              height: 50,
              width: 50,
              image: AppImages.person,
            ),
            title: CustomText(
              text: profileName ?? '',
              style: AppTextStyles.black18w700,
            ),
            subtitle: CustomText(
              text: followers ?? '',
              style: AppTextStyles.black16w400,
            ),
            trailing: CustomButton(
              width: 80,
              color: AppColors.darkblue,
              text: 'Follow',
              onTap: onFollowTap,
              verticalPadding: 10,
              textStyle: AppTextStyles.white14w500,
            )),
      ),
    );
  }
}
