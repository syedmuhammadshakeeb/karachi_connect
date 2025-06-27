import 'package:flutter/material.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
      child: Lottie.asset(AppIcons.loader, repeat: true),
    );
  }
}
