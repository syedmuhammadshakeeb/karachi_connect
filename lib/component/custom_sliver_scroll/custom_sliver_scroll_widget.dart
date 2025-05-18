import 'package:flutter/material.dart';
import 'package:karachi_connect/component/circular_Icon_widget/cisrcular_icon_widget.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/circular_profile_component.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/component/list_user_bio_widget.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CustomSliverScrollWidget extends StatelessWidget {
  final List<String>? tabText;
  final String? profileImage,
      profileText,
      userName,
      userBio,
      location,
      dob,
      profession,
      joinedDate,
      link,
      followrs,
      following,
      userTitle,
      coverImage;

  const CustomSliverScrollWidget(
      {super.key,
      this.tabText,
      this.profileImage,
      this.profileText,
      this.userName,
      this.userBio,
      this.location,
      this.dob,
      this.profession,
      this.joinedDate,
      this.link,
      this.followrs,
      this.following,
      this.userTitle,
      this.coverImage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabText?.length ?? 0,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    onTap: (value) {},
                    tabs: List.generate(tabText?.length ?? 0, (index) {
                      return Tab(
                          child: CustomText(
                        text: tabText?[index] ?? '',
                        style: AppTextStyles.black15w700,
                      ));
                    }))),
            expandedHeight: MediaQuery.of(context).size.height / 2,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    LoadingImage(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        isLocalAsset: true,
                        image: coverImage),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 66),
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                image: DecorationImage(
                                    image: AssetImage(AppImages.bgImage),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const CisrcularIconWidget(
                                        icon: Icons.more_horiz_outlined,
                                        size: 36,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const CisrcularIconWidget(
                                        icon: Icons.chat_outlined,
                                        size: 36,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.blue07
                                              .withValues(alpha: 0.3),
                                        ),
                                        child: const Center(
                                          child: CustomText(
                                            text: 'Follow',
                                            style: AppTextStyles.black16w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text: userTitle ?? '',
                                    style: AppTextStyles.black20w700,
                                  ),
                                  CustomText(
                                    text: '@${userName ?? ''}',
                                    style: AppTextStyles.grey6513w400,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    text: userBio ?? '',
                                    style: AppTextStyles.black15w500,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: ListUserBioWidget()),
                                  Row(
                                    children: [
                                      Row(children: [
                                        CustomText(
                                          text: following ?? '',
                                          style: AppTextStyles.black15w700,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const CustomText(
                                          text: 'Following',
                                          style: AppTextStyles.grey6515w500,
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Row(children: [
                                        CustomText(
                                          text: followrs ?? "",
                                          style: AppTextStyles.black15w700,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const CustomText(
                                            text: 'Followers',
                                            style: AppTextStyles.grey6515w500),
                                      ]),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 20,
                            child: CircularProfileComponent(
                              height: 132,
                              width: 132,
                              profileImage: AppImages.profileImage,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
