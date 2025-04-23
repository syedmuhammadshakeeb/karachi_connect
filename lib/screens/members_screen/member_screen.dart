import 'package:flutter/material.dart';
import 'package:karachi_connect/component/profile_component/follow_profile_card.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              forceMaterialTransparency: true,
              backgroundColor: AppColors.blue07.withValues(alpha: 0.1),
              title: const CustomText(
                text: Enviroment.enterprenuer == 'Investors'
                    ? 'Entrepreneur'
                    : 'Investor',
                style: AppTextStyles.black22wbold,
              ),
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: MediaQuery.of(context).size.height * 0.15),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: FollowProfileCard(
                    followers: '1,223 Followers',
                    image: AppImages.person,
                    onFollowTap: () {},
                    onTap: () {},
                    profileName: 'S. M. Shakeeb',
                  ),
                );
              }),
        ));
  }
}
