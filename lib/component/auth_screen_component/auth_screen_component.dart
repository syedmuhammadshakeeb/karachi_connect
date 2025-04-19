import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AuthScreenComponent extends StatelessWidget {
  const AuthScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.darkblue,
          AppColors.lightblue,
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Karachi Connect',
            style: AppTextStyles.white30w500,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.blue8f,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
              ),
              Container(
                margin:const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child:const Column(
                  children: [
                 CustomText(text: 'text'),
                 CustomText(text: 'text'),
                 CustomTextField(),
                 CustomTextField(),
                 CustomButton(),

                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
