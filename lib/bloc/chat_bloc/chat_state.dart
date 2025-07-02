import 'package:karachi_connect/model/chat_model/chat_model.dart';

class ChatState {
  List<ChatModel>? messages;
  bool? isLoading;
  final Map<String, String>?
      userLastMessages; // Store last message for each user
  final Map<String, DateTime>? userLastTimestamps;

  ChatState(
      {this.isLoading,
      this.messages,
      this.userLastMessages,
      this.userLastTimestamps});

  ChatState copyWith(
      {List<ChatModel>? messages,
      bool? isLoading,
      Map<String, String>? userLastMessages,
      Map<String, DateTime>? userLastTimestamps}) {
    return ChatState(
        messages: messages ?? this.messages,
        userLastTimestamps: userLastTimestamps ?? this.userLastTimestamps,
        userLastMessages: userLastMessages ?? this.userLastMessages,
        isLoading: isLoading ?? this.isLoading);
  }
}
