import 'package:flutter/material.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';
import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: CustomButton(
          color: AppColors.darkblue,
          verticalPadding: 20,
          horizontalPadding: 30,
          onTap: () {
            Navigator.pushReplacementNamed(context, RouteName.loginScreen);
          },
          text: 'Upload Document',
          textStyle: AppTextStyles.white16w500,
        ),
        body: AuthScreenComponent(
          onDocumentTap: () {},
        ));
  }
}
