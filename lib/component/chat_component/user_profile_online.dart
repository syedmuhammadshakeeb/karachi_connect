import 'package:flutter/material.dart';
import 'package:karachi_connect/component/profile_component/circular_profile_image.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class UserProfileOnline extends StatelessWidget {
  final String? image;
  final Color? onlineColor;
  const UserProfileOnline({super.key, this.image, this.onlineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 49,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
      child: Stack(
        children: [
          CircularProfileImage(
            height: 50,
            width: 50,
            image: image,
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: onlineColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
