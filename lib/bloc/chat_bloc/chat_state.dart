import 'package:karachi_connect/model/chat_model/chat_model.dart';

class ChatState {
  List<ChatModel>? messages;
  bool? isLoading;

  ChatState({this.isLoading, this.messages});

  ChatState copyWith({List<ChatModel>? messages, bool? isLoading}) {
    return ChatState(messages: messages ?? this.messages, isLoading: isLoading ?? this.isLoading);
  }

}
