import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/profile_screen_bloc/profile_tabbar_bloc/profile_tabbar_bloc.dart';
import 'package:karachi_connect/bloc/profile_screen_bloc/profile_tabbar_bloc/profile_tabbar_events.dart';
import 'package:karachi_connect/bloc/profile_screen_bloc/profile_tabbar_bloc/profile_tabbar_state.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';
import 'package:karachi_connect/component/circular_Icon_widget/cisrcular_icon_widget.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/circular_profile_component.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/component/list_user_bio_widget.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CustomSliverScrollWidget extends StatefulWidget {
  final List<String>? tabText;
  final List<Widget>? screens;
  final Widget? child;
  final bool isFirstScreenInTab;
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
      this.isFirstScreenInTab = false,
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
      this.child,
      this.screens,
      this.coverImage});

  @override
  State<CustomSliverScrollWidget> createState() =>
      _CustomSliverScrollWidgetState();
}

class _CustomSliverScrollWidgetState extends State<CustomSliverScrollWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    const double threshold = 120.0;
    if (_scrollController.offset > threshold && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= threshold && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabText?.length ?? 0,
      child: BlocProvider(
        create: (context) => ProfileTabbarBloc(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.blueEC,
              pinned: true,
              automaticallyImplyLeading: false,
              title: _isScrolled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircularProfileImage(
                              height: 24,
                              width: 24,
                              image: AppImages.profileImage,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: widget.userTitle ?? '',
                              style: AppTextStyles.black18w700,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CisrcularIconWidget(
                              icon: Icons.more_horiz_outlined,
                              size: 36,
                            ),
                            SizedBox(width: 10),
                            CisrcularIconWidget(
                              icon: Icons.chat_outlined,
                              size: 36,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(64),
                  child: BlocBuilder<ProfileTabbarBloc, ProfileTabbarState>(
                      builder: (context, state) {
                    return TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: AppColors.black,
                        onTap: (value) {
                          context
                              .read<ProfileTabbarBloc>()
                              .add(ProfileTabbar(index: value));
                        },
                        tabs:
                            List.generate(widget.tabText?.length ?? 0, (index) {
                          return Tab(
                              child: CustomText(
                            text: widget.tabText?[index] ?? '',
                            style: state.index == index
                                ? AppTextStyles.black15w700
                                : AppTextStyles.grey6515w700,
                          ));
                        }));
                  })),
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
                          image: widget.coverImage),
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
                                      text: widget.userTitle ?? '',
                                      style: AppTextStyles.black20w700,
                                    ),
                                    CustomText(
                                      text: '@${widget.userName ?? ''}',
                                      style: AppTextStyles.grey6513w400,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomText(
                                      text: widget.userBio ?? '',
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
                                            text: widget.following ?? '',
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
                                            text: widget.followrs ?? "",
                                            style: AppTextStyles.black15w700,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const CustomText(
                                              text: 'Followers',
                                              style:
                                                  AppTextStyles.grey6515w500),
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
            ),
            BlocBuilder<ProfileTabbarBloc, ProfileTabbarState>(
              builder: (context, state) {
                return SliverToBoxAdapter(
                    child: widget.screens?[state.index ?? 0]);
              },
            )
          ],
        ),
      ),
    );
  }
}
