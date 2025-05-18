import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CisrcularIconWidget extends StatelessWidget {
  final double? size;
  final IconData? icon;
  const CisrcularIconWidget({super.key, this.size, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.transparent,
        border: Border.all(color: AppColors.greyb4, width: 1),
      ),
      child: Center(child: Icon(icon)),
    );
  }
}
