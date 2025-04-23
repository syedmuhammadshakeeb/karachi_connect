import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AccountSucessfullScreen extends StatelessWidget {
  const AccountSucessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      bottomNavigationBar: CustomButton(
        onTap: () {
          Navigator.pushReplacementNamed(context, RouteName.main);
        },
        color: AppColors.darkblue,
        verticalPadding: 20,
        text: 'Get Started',
        textStyle: AppTextStyles.white18w500,
        horizontalPadding: 30,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            LoadingImage(
              image: AppIcons.sucessfulIcon,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Congratulations',
                  style: AppTextStyles.black22wbold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Document Submitted Sucessfully',
                  style: AppTextStyles.black22wbold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
