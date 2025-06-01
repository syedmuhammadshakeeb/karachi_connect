import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class CisrcularIconWidget extends StatelessWidget {
  final double? size;
  final IconData? icon;
  final String? svgIcon;
  final Color? color;
  const CisrcularIconWidget(
      {super.key, this.size, this.icon, this.svgIcon, this.color});

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
      child: Center(
          child: svgIcon != null
              ? SvgPicture.asset(
                  svgIcon!,
                  colorFilter: ColorFilter.mode(
                      color ?? AppColors.black, BlendMode.srcIn),
                )
              : Icon(
                  icon,
                )),
    );
  }
}
