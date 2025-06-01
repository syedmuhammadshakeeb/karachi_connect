import 'package:flutter/material.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_appbar.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: ChattingScreenAppbar()),
      bottomNavigationBar: null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
        ),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
