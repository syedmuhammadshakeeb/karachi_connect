import 'package:karachi_connect/model/chat_model/chat_model.dart';

abstract class ChatEvent {
  ChatEvent();
}


class AddChatMessageEvent extends ChatEvent {
 final ChatModel message;
  AddChatMessageEvent({
    required this.message,
   
  });
  
}