import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/custom_sliver_scroll_widget.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSliverScrollWidget(
        coverImage: AppImages.garden,
        dob: 'Born November 7, 1987',
        following: '133',
        followrs: '154',
        joinedDate: 'Joined November 2010',
        location: 'Earth',
        link: 'neprokin.com',
        profession: 'Entrepreneur',
        profileImage: AppImages.profileImage,
        profileText: 'Stas Neprokin',
        tabText: ['Posts', 'Replies', 'Highlights', 'Media'],
        userBio: 'Designing Products that Users Love',
        userName: '@sneprokin',
        userTitle: 'Stas Neprokin',
      ),
    );
  }
}
