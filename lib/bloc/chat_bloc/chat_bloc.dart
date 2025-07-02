import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_event.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_state.dart';
import 'package:karachi_connect/services/chat_service.dart';
import 'package:karachi_connect/utils/functions/error_handler.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<AddChatMessageEvent>(addMessage);
    on<SendChatMessageEvent>(sendChatMessage);
    on<GetChatMessageEvent>(getChatApi);
  }
  ChatService chatService = ChatService();
// send chat
  Future sendChatMessage(
      SendChatMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await chatService.sendChatMessages(event.message);

      final messageList = state.messages ?? [];
      messageList.add(response!);
      emit(state.copyWith(messages: messageList, isLoading: false));
    } catch (e) {
      log("message sending error: $e");
      emit(state.copyWith(isLoading: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

// get chat api
  Future getChatApi(GetChatMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      // Fetch the chat messages for the user
      final getChatsList = await chatService.getChatMessages(
        event.sendreId,
        event.recieverId,
      );

      // Get the last message and timestamp for the current user
      String? lastMessageText =
          (getChatsList?.isNotEmpty == true) ? getChatsList?.last.text : '';
      DateTime? lastMessageTimestamp = getChatsList?.isNotEmpty == true
          ? getChatsList!.last.timestamp
              // Format timestamp as string
          : DateTime.now();

      // Update the state with the messages and the last message and timestamp for the current user
      emit(state.copyWith(
        messages: getChatsList,
        isLoading: false,
        userLastMessages: {
          ...state.userLastMessages ?? {},
          event.recieverId:
              lastMessageText ?? '', // Add the last message for the receiverId
        },
        userLastTimestamps: {
          ...state.userLastTimestamps ?? {},
          event.recieverId:
              lastMessageTimestamp!, // Add the last timestamp for the receiverId
        },
      ));
    } catch (e) {
      log("message sending error: $e");
      emit(state.copyWith(isLoading: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

  //  Add message to list
  Future addMessage(AddChatMessageEvent event, Emitter<ChatState> emit) async {
    final messageList = state.messages ?? [];
    messageList.add(event.message);
  }
}
