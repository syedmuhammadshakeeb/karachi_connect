import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_event.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<AddChatMessageEvent>(addMessage);
  }


  //  Add message to list
  Future addMessage(AddChatMessageEvent event, Emitter<ChatState> emit) async {
    final messageList = state.messages ?? [];
    messageList.add(event.message);
    emit(state.copyWith(messages: messageList));
  }

}
