import 'package:flutter/widgets.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CreatePostUi extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? summaryController;
  final TextEditingController? descriptionController;
  final FormFieldValidator<String>? titleValidator;
  final FormFieldValidator<String>? summaryValidator;
  final FormFieldValidator<String>? descriptionValidator;
  final Function()? onCreatePostTap;
  const CreatePostUi({
    super.key,
    this.titleController,
    this.summaryController,
    this.descriptionController,
    this.titleValidator,
    this.summaryValidator,
    this.descriptionValidator,
    this.onCreatePostTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: 'Enter Title',
            style: AppTextStyles.black18w700,
            children: [
              TextSpan(
                text: ' *',
                style: AppTextStyles.red14w600.copyWith(fontSize: 18),
              ),
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: "Enter Title",
            textStyle: AppTextStyles.grey14w500,
            controller: titleController,
            borderColor: AppColors.greyb4,
            fieldColor: AppColors.blueEC,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: 'Enter Summary',
            style: AppTextStyles.black18w700,
            children: [
              TextSpan(
                text: ' *',
                style: AppTextStyles.red14w600.copyWith(fontSize: 18),
              ),
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: "Enter Summary",
            textStyle: AppTextStyles.grey14w500,
            borderColor: AppColors.greyb4,
            controller: summaryController,
            keyboardType: TextInputType.multiline,
            mixLines: 4,
            fieldColor: AppColors.blueEC,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: 'Enter Description',
            style: AppTextStyles.black18w700,
            children: [
              TextSpan(
                text: ' *',
                style: AppTextStyles.red14w600.copyWith(fontSize: 18),
              ),
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: "Enter Description",
            textStyle: AppTextStyles.grey14w500,
            controller: descriptionController,
            keyboardType: TextInputType.multiline,
            borderColor: AppColors.greyb4,
            fieldColor: AppColors.blueEC,
            mixLines: 8,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.blueEC.withValues(alpha: 0.6),
                AppColors.blueEC.withValues(alpha: 0.6),
                AppColors.blueEC,
              ]),
            ),
            child: CustomButton(
              onTap: onCreatePostTap,
              color: AppColors.darkblue,
              width: MediaQuery.of(context).size.width,
              text: 'Create Idea',
              textStyle: AppTextStyles.white16w500,
              verticalPadding: 10,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
