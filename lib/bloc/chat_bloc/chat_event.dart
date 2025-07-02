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

class SendChatMessageEvent extends ChatEvent {
  final ChatModel message;
  SendChatMessageEvent({
    required this.message,
  });
}

class GetChatMessageEvent extends ChatEvent {
  final String sendreId;
  final String recieverId;
  GetChatMessageEvent({
    required this.sendreId,
    required this.recieverId,
  });
}

class IsLastMessage extends ChatEvent {}
