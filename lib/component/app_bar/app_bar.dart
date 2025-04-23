import 'package:flutter/material.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';

class CustomAppBar extends StatelessWidget {
  final bool isSearchIcon, isNotification, isChatIcon;
  final Function()? searchTap, notificationTap, chatTap;
  const CustomAppBar(
      {super.key,
      this.chatTap,
      this.notificationTap,
      this.searchTap,
      this.isChatIcon = true,
      this.isNotification = true,
      this.isSearchIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.transparent,
      title: const AppName(
        appIcon: false,
        fontSize: 20,
      ),
      actions: [
        if (isSearchIcon) ...[
          InkWell(
            onTap: searchTap,
            child: const LoadingImage(
              image: AppIcons.searchIcon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        if (isNotification) ...[
          InkWell(
            onTap: notificationTap,
            child: const LoadingImage(
              image: AppIcons.notificationIcon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        if (isChatIcon) ...[
          InkWell(
            onTap: chatTap,
            child: const LoadingImage(
              image: AppIcons.chatIcon,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ],
    );
  }
}
