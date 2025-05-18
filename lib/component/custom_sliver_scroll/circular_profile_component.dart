import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CircularProfileComponent extends StatelessWidget {
  final double? height, width;
  final String? profileImage;
  const CircularProfileComponent(
      {super.key, this.height, this.width, this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(color: AppColors.black, width: 3),
      ),
      child: LoadingImage(
        image: profileImage,
        boxfit: BoxFit.fill,
      ),
    );
  }
}
