import 'package:flutter/material.dart';
import 'package:karachi_connect/component/home_post_card/home_post_card.dart';
import 'package:karachi_connect/model/post_model/post_model.dart';
import 'package:karachi_connect/services/shared_preference/shared_preference.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel>? postList = [];

    SharedPreferenceService.getPostListLocally().then((posts) {
      postList = posts;
    });
    print("post List ${postList?.length}");
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: postList?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: HomePostCard(
                commentCount: '1,234',
                description: postList?[index].description ?? '',
                likeCount: '1,34',
                profileImage: AppImages.profileImage,
                name: postList?[index].title ?? '',
                time: '3.09 am',
              ),
            );
          }),
    );
  }
}
