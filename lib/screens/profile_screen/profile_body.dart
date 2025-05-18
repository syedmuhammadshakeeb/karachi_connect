import 'package:flutter/material.dart';
import 'package:karachi_connect/component/home_post_card/home_post_card.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics:const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: HomePostCard(),
            );
          }),
    );
  }
}
