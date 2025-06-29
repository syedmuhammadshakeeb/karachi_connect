import 'package:flutter/material.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_appbar.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_navbar.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_ui.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: ChattingScreenAppbar()),
      bottomNavigationBar: ChattingScreenNavbar(
        messageController: messageController,
        onAudioMessageTap: () {},
        onCameraTap: () {},
        onFileTap: () {},
      ),
      body:ChattingScreenUi()
    );
  }
}
