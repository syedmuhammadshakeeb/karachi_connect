import 'package:flutter/material.dart';
import 'package:karachi_connect/component/chat_component/user_profile_online.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChatProfileCard extends StatelessWidget {
  final String? image, profileName, lastMessage, time;
  final Function()? onTap;

  final Color? onlineColor;

  const ChatProfileCard(
      {super.key,
      this.image,
      this.onlineColor,
      this.time,
      this.onTap,
      this.profileName,
      this.lastMessage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
          leading: UserProfileOnline(
            image: image,
            onlineColor: onlineColor,
          ),
          title: CustomText(
            text: profileName ?? '',
            style: AppTextStyles.black18w700,
          ),
          subtitle: CustomText(
            text: lastMessage ?? '',
            style: AppTextStyles.black16w400,
          ),
          trailing: CustomText(
            text: time ?? '',
            style: AppTextStyles.black14w500,
          ),
        ),
      ),
    );
  }
}
