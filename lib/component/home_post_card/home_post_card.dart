import 'package:flutter/material.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class HomePostCard extends StatelessWidget {
  final String? profileImage,
      name,
      time,
      description,
      likeCount,
      commentCount,
      image;
  final Function()? onLikeTap, onCommentTap;
  const HomePostCard(
      {super.key,
      this.profileImage,
      this.name,
      this.time,
      this.description,
      this.likeCount,
      this.commentCount,
      this.onLikeTap,
      this.onCommentTap,
      this.image});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircularProfileImage(
                height: 50,
                width: 50,
                image: profileImage ?? '',
              ),
              title: CustomText(
                text: name ?? '',
                style: AppTextStyles.black18wbold,
              ),
              subtitle: CustomText(
                text: time ?? '',
                style: AppTextStyles.black12w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: CustomText(
                text: description ?? '',
                style: image != null && image!.isNotEmpty
                    ? AppTextStyles.black20w700
                    : AppTextStyles.black14w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (image != null && image!.isNotEmpty) ...[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.garden),
                        fit: BoxFit.cover)),
              )
            ],
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      const LoadingImage(
                        image: AppIcons.likeIcon,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: likeCount ?? '',
                        style: AppTextStyles.black14w600,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onCommentTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const LoadingImage(
                                image: AppIcons.commentIcon,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                text: commentCount ?? '',
                                style: AppTextStyles.black14w600,
                              )
                            ],
                          ),
                          if (AuthBloc.userRole == Enviroment.investor) ...[
                            InkWell(
                              onTap: onLikeTap,
                              child: const CustomText(
                                text: "See Full Post",
                                style: AppTextStyles.blue14w500,
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
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
