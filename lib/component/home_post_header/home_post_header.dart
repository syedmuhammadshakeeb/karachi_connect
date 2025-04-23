import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class HomePostHeader extends StatelessWidget {
  final double? vpadding, hpadding;
  final Function()? onTap;
  const HomePostHeader({super.key, this.vpadding, this.hpadding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(
            horizontal: hpadding ?? 0, vertical: vpadding ?? 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            AppColors.blue07.withValues(alpha: 0.05),
            AppColors.blue07.withValues(alpha: 0.05),
            AppColors.blue07.withValues(alpha: 0.05),
          ]),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const CircularProfileImage(
                    height: 40,
                    width: 40,
                    image: AppImages.person,
                  ),
                  title: CustomText(
                      text: 'Whats on your head?',
                      style: AppTextStyles.black18w500.copyWith(
                        color: AppColors.black.withValues(alpha: 0.5),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      LoadingImage(
                        image: AppIcons.imageIcon,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        text: 'Image',
                        style: AppTextStyles.black14w500,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  LoadingImage(
                    image: AppIcons.line,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      LoadingImage(
                        image: AppIcons.videoIcon,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        text: 'Video',
                        style: AppTextStyles.black14w500,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  LoadingImage(
                    image: AppIcons.line,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      LoadingImage(
                        image: AppIcons.videoIcon,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        text: 'Attrach',
                        style: AppTextStyles.black14w500,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
