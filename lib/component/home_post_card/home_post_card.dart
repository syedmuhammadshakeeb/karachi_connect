import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class HomePostCard extends StatelessWidget {
  const HomePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
            border: Border.all(color: AppColors.greyD6)),
        child: Column(
          children: [
            const ListTile(
              leading: CircularProfileImage(
                height: 50,
                width: 50,
                image: AppImages.person,
              ),
              title: CustomText(
                text: 'S. M. Shakeeb',
                style: AppTextStyles.black18wbold,
              ),
              subtitle: CustomText(
                text: '08:39 am',
                style: AppTextStyles.black12w400,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: CustomText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla natoque id aenean.',
                style: AppTextStyles.black14w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.garden), fit: BoxFit.cover)),
            ),
         const   Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child:  Row(
                children: [
                  Row(
                    children: [
                      LoadingImage(
                        image: AppIcons.likeIcon,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: '1,223',
                        style: AppTextStyles.black14w600,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      LoadingImage(
                        image: AppIcons.commentIcon,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: '1,223',
                        style: AppTextStyles.black14w600,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
