import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_event.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_events.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';
import 'package:karachi_connect/component/app_bar/app_bar.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/home_post_card/home_post_card.dart';
import 'package:karachi_connect/component/home_post_header/home_post_header.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/detail_post_screen/detail_post_screen.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostBloc>().add(GetPostData(id: AuthBloc.userId));
    });
  }

  TextEditingController commentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.transparent,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: BlocBuilder<TabbarBloc, TabbarStates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CustomAppBar(
                  searchTap: () {
                    Navigator.pushNamed(context, RouteName.searchScreen);
                  },
                  notificationTap: () {},
                  chatTap: () {
                    context.read<TabbarBloc>().add(TabValueSelector(3));
                  },
                  isChatIcon: true,
                  isNotification: true,
                  isSearchIcon: true,
                ),
              );
            },
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const LoadingComponent();
            }
            return ListView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              children: [
                BlocBuilder<TabbarBloc, TabbarStates>(
                  builder: (context, state) {
                    return HomePostHeader(
                      onTap: () {
                        context.read<TabbarBloc>().add(TabValueSelector(2));
                      },
                      hpadding: 30,
                    );
                  },
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.getPostList?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final post = state.getPostList?[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: HomePostCard(
                          onCommentTap: () async {
                            await showModalBottomSheet(
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: AppColors.blueEC,
                                context: context,
                                builder: (context) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    child: Scaffold(
                                      backgroundColor: AppColors.white,
                                      body: ListView.builder(
                                          itemCount: post?.comments?.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                ListTile(
                                                  leading: LoadingImage(
                                                    image: AppImages.person,
                                                  ),
                                                  title: CustomText(
                                                    text:
                                                        post?.createdBy?.name ??
                                                            '',
                                                    style: AppTextStyles
                                                        .black18w700,
                                                  ),
                                                  subtitle: CustomText(
                                                    text: post?.comments?[index]
                                                            .content ??
                                                        '',
                                                    style: AppTextStyles
                                                        .black16w400,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20.0),
                                                  child: Divider(
                                                    color: AppColors.greyb4,
                                                  ),
                                                )
                                              ],
                                            );
                                          }),
                                      bottomNavigationBar: Container(
                                        height: 80,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: AppColors.blueEC,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: CustomTextField(
                                                hintText: "Write your Comment",
                                                controller: commentcontroller,
                                                borderColor: AppColors.greyb4,
                                                safixIcon: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<PostBloc>()
                                                          .add(PostCommentEvent(
                                                              postid:
                                                                  post?.id ??
                                                                      '',
                                                              comment:
                                                                  commentcontroller
                                                                      .text,
                                                              senderId: AuthBloc
                                                                      .userId ??
                                                                  ''));
                                                    },
                                                    child:
                                                        const Icon(Icons.send)),
                                                fieldColor: AppColors.blueEC,
                                                textStyle:
                                                    AppTextStyles.grey14w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          onLikeTap: () {
                            Navigator.pushNamed(
                                context, RouteName.detailPostScreen,
                                arguments: DetailPostArgument(
                                  discription: post?.description ?? '',
                                  summery: post?.summary ?? '',
                                  title: post?.title ?? '',
                                ));
                          },
                          commentCount: '1,234',
                          description: post?.description ?? '',
                          likeCount: '1,234',
                          name: post?.title ?? '',
                          profileImage: AppImages.person,
                          time: "3.09am",
                        ),
                      );
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
