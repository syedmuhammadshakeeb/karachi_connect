import 'package:flutter/material.dart';

import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class SearchAppbar extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? searchController;
  final Function()? onCancelTap;
  const SearchAppbar({super.key, this.onChanged, this.searchController, this.onCancelTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppColors.blueEC,
        AppColors.blueEC.withValues(alpha: 0.8),
        AppColors.blueEC.withValues(alpha: 0.4),
      ])),
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 50),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Search here...',
                controller: searchController,
                textStyle: AppTextStyles.grey14w500,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                borderColor: AppColors.greyb4,
                fieldColor: AppColors.blueEC,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap:onCancelTap ,
              child: const CustomText(
                text: 'Cancel',
                style: AppTextStyles.blue16w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
