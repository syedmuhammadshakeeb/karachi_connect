import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/component/home_post_card/home_post_card.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        print("user ownposts${state.userOwnPostList}");
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          ),
          child: state.userOwnPostList == null ||
                  state.userOwnPostList?.isEmpty == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CustomText(
                      text: "No Post Avilable",
                      style: AppTextStyles.black18wbold,
                    ),
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomText(
                        text: 'See Your Posts',
                        style: AppTextStyles.black20w700,
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.userOwnPostList?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = state.userOwnPostList?[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: HomePostCard(
                              commentCount: '1,234',
                              description: data?.description ?? '',
                              profileImage:
                                  data?.createdBy?.profileImage ?? AppImages.person,
                              likeCount: '1,34',
                              name: data?.title ?? '',
                              time: '3.09 am',
                            ),
                          );
                        }),
                  ],
                ),
        );
      },
    );
  }
}
