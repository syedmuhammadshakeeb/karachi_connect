import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChattingScreenNavbar extends StatelessWidget {
  final TextEditingController? messageController;
  final Function()? onFileTap, onCameraTap, onAudioMessageTap, onSendTap;

  const ChattingScreenNavbar(
      {super.key,
      this.messageController,
      this.onSendTap,
      this.onAudioMessageTap,
      this.onCameraTap,
      this.onFileTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      color: AppColors.blueEC.withValues(alpha: 0.8),
      child: Row(
        children: [
          InkWell(
            onTap: onFileTap,
            child: const LoadingImage(
              image: AppIcons.portfolioLinkIcon,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: CustomTextField(
              hintText: "Write your Message",
              controller: messageController,
              
              borderColor: AppColors.greyb4,
              safixIcon: InkWell(
                onTap:onSendTap ,
                child: Icon(Icons.send)),
              fieldColor: AppColors.blueEC,
              textStyle: AppTextStyles.grey14w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: onCameraTap,
            child: const LoadingImage(
              image: AppIcons.cameraIcon,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: onAudioMessageTap,
            child: const LoadingImage(
              image: AppIcons.audioMessageIcon,
            ),
          ),
        ],
      ),
    );
  }
}
