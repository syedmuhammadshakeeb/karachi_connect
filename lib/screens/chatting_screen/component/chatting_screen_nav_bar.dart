import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';

class ChattingScreenNavBar extends StatelessWidget {
  const ChattingScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextField(),

      ],
    );
  }
}