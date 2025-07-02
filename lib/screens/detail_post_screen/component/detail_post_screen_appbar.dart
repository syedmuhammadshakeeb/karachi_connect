import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

class DetailPostScreenAppbar extends StatelessWidget {
  const DetailPostScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blueEC,
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      title: const Text('Detail Post'),
      centerTitle: true,
    );
  }
}
