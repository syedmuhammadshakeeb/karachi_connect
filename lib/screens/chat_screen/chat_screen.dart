import 'package:flutter/material.dart';
import 'package:karachi_connect/component/chat_component/chat_profile_card.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.blueEC.withValues(alpha: 0.8),
          title: const CustomText(
            text: 'Inbox',
            style: AppTextStyles.black22wbold,
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0)
                    .copyWith(bottom: 10),
                child: CustomTextField(
                  hintText: 'Search...',
                  fieldColor: AppColors.blueEC.withValues(alpha: 0.05),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0).copyWith(left: 20),
                    child: const LoadingImage(
                      image: AppIcons.searchField,
                      color: AppColors.blue07,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  borderColor: AppColors.blue07,
                  textStyle: AppTextStyles.blue14w500,
                ),
              )),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          ),
          child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0)
                  .copyWith(top: 20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: ChatProfileCard(
                    lastMessage: 'Hi! how are you',
                    profileName: 'S. M. Shakeeb',
                    time: '03:09 am',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.chattingScreen);
                    },
                    image: AppImages.person,
                    onlineColor: AppColors.blue07,
                  ),
                );
              })),
    );
  }
}
