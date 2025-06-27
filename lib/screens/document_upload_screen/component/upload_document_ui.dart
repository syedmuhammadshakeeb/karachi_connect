import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class UploadDocumentUi extends StatelessWidget {
  final Function()? onDocumentTap;
  final Function()? onDocumentCanceltap;
  final TextEditingController? ntnController;
  final FormFieldValidator<String>? ntnValidator;
  final String? filesName;
  final String? fileMb;
  final bool documentUpload;
  const UploadDocumentUi(
      {super.key,
      this.onDocumentTap,
      this.documentUpload = false,
      this.ntnController,
      this.ntnValidator,
      this.filesName,
      this.onDocumentCanceltap,
      this.fileMb});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.4),
              children: [
                const AppName(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.14,
                ),
                const CustomText(
                  text:
                      'To proceed as an Investor, please upload your annual income transcript for verification',
                  style: AppTextStyles.black16w500,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: onDocumentTap,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width - 80,
                      child: DottedBorder(
                          options: RectDottedBorderOptions(
                            strokeWidth: 2,
                            // borderType: BorderType.RRect,
                            dashPattern: [8, 8, 8, 8],
                            strokeCap: StrokeCap.round,

                            // radius: const Radius.circular(15),
                            color: documentUpload
                                ? AppColors.red
                                : AppColors.darkblue,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const LoadingImage(
                                  image: AppIcons.uploadIcon,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: const TextSpan(
                                        text: 'Drag your file(s) or',
                                        style: AppTextStyles.grey6514w500,
                                        children: [
                                      TextSpan(
                                          text: ' browse',
                                          style: AppTextStyles.blue14w500)
                                    ])),
                                const SizedBox(
                                  height: 5,
                                ),
                                const CustomText(
                                  text:
                                      'Only support .jpg, .png and .svg and zip files',
                                  style: AppTextStyles.grey6514w500,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                if (documentUpload == true) ...[
                  const SizedBox(
                    height: 6,
                  ),
                  const CustomText(
                    text: 'Document must be uploaded',
                    style: AppTextStyles.red12w400,
                  )
                ],
                if ((filesName != null && filesName?.isNotEmpty == true) &&
                    (fileMb != null && fileMb?.isNotEmpty == true)) ...[
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey4d),
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: const LoadingImage(
                          image: AppIcons.uploadIcon,
                          boxfit: BoxFit.fill,
                        ),
                        title: CustomText(
                          text: filesName ?? '',
                          style: AppTextStyles.black14w600,
                        ),
                        subtitle: CustomText(
                          text: "$fileMb MB",
                          style: AppTextStyles.grey14w500,
                        ),
                        trailing: InkWell(
                          onTap: onDocumentCanceltap,
                          child: const LoadingImage(
                            image: AppIcons.cancelIcon,
                          ),
                        ),
                      )),
                ],
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  borderColor: AppColors.grey4d,
                  controller: ntnController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.fileIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  validate: ntnValidator,
                  hintText: 'Enter Ntn no.',
                ),
              ],
            ),
          )),
    );
  }
}
