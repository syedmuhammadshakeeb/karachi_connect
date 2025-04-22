import 'package:flutter/material.dart';
import 'package:karachi_connect/component/auth_appbar/auth_appbar.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/sign_up_screen/signup_screen.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AskingSigninScreen extends StatelessWidget {
  const AskingSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AuthAppbar(
            leadingIcon: Icons.arrow_back_ios,
            onLeadingIconTap: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoadingImage(
                image: AppIcons.signInPermission,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text:
                    'Select your role to begin. Sign in as either an Investor or an Entrepreneur.',
                style: AppTextStyles.black16w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                horizontalPadding: 10,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUpScreen,
                      arguments:
                          SignupScreenArguemnt(signUpAs: Enviroment.investor));
                },
                color: AppColors.darkblue,
                width: MediaQuery.of(context).size.width,
                text: 'Sign Up as Invester',
                textStyle: AppTextStyles.white16w500,
                verticalPadding: 10,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUpScreen,
                      arguments: SignupScreenArguemnt(
                          signUpAs: Enviroment.enterprenuer));
                },
                horizontalPadding: 10,
                color: AppColors.white,
                bordercolor: AppColors.grey65,
                width: MediaQuery.of(context).size.width,
                text: 'Sign In as Enterpreneur',
                textStyle: AppTextStyles.grey6516w600,
                verticalPadding: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
