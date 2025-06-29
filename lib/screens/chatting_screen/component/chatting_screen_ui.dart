import 'package:flutter/material.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChattingScreenUi extends StatelessWidget {
  final List<String>? senderId;
  final List<String>? message;
  const ChattingScreenUi({super.key, this.senderId, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: message?.length ?? 0,
              reverse: true,

              // shrinkWrap: true, // Example item count
              itemBuilder: (context, index) {
                bool? isChatid = senderId?[index] != AuthBloc.userId;
                return Align(
                  alignment:
                      isChatid ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    padding: const EdgeInsets.all(10), 
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: isChatid ? AppColors.greyb4 : AppColors.blue07,
                      borderRadius: isChatid
                          ? const BorderRadius.all(Radius.circular(10))
                              .copyWith(
                              topLeft: const Radius.circular(0),
                            )
                          : const BorderRadius.all(Radius.circular(10))
                              .copyWith(
                              topRight: const Radius.circular(0),
                            ),
                    ),
                    child: CustomText(
                      text:message?[index] ?? '',
                      style: isChatid
                          ? AppTextStyles.black14w500
                          : AppTextStyles.white14w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
