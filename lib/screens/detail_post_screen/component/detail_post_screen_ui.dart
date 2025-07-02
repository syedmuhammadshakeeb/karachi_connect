import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class DetailPostScreenUi extends StatelessWidget {
  final String? title, summery, discription;
  const DetailPostScreenUi(
      {super.key, this.discription, this.summery, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomText(
            text: 'Title:',
            style: AppTextStyles.black28w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: title ?? '',
            style: AppTextStyles.black15w500,
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: 'Summery:',
            style: AppTextStyles.black28w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: summery ?? '',
            style: AppTextStyles.black15w500,
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: 'Discription:',
            style: AppTextStyles.black28w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: discription ?? '',
            style: AppTextStyles.black15w500,
          ),
        ],
      ),
    );
  }
}
