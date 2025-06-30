import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_event.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_state.dart';
import 'package:karachi_connect/model/chat_model/chat_model.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_appbar.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_navbar.dart';
import 'package:karachi_connect/screens/chatting_screen/component/chatting_screen_ui.dart';

class ChattingScreen extends StatelessWidget {
  final String? userId;
  final String? name;
  const ChattingScreen({super.key, this.name, this.userId});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          
          return Scaffold(
              appBar:  PreferredSize(
                  preferredSize:const Size.fromHeight(50),
                  child: ChattingScreenAppbar(
                    name: name,
                  )),
              bottomNavigationBar: ChattingScreenNavbar(
                messageController: messageController,
                onSendTap: () {
                  if (messageController.text.isNotEmpty) {
                    context.read<ChatBloc>().add(
                          AddChatMessageEvent(
                              message: ChatModel(
                            message: messageController.text,
                            senderId: AuthBloc.userId,
                            receiverId: userId,
                          )),
                        );
                    messageController.clear();
                  }
                },
                onAudioMessageTap: () {},
                onCameraTap: () {},
                onFileTap: () {},
              ),
              resizeToAvoidBottomInset: true,
              body: ChattingScreenUi(
                message: state.messages,
              ));
        },
      ),
    );
  }
}

class ChattingScreenArgument {
  final String? userId;
   final String? name;
  ChattingScreenArgument({this.userId, this.name});
}
