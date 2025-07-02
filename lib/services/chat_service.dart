import 'package:dio/dio.dart';
import 'package:karachi_connect/model/chat_model/chat_model.dart';
import 'package:karachi_connect/services/api_service/api_service.dart';
import 'package:karachi_connect/utils/constants/app_urls.dart';

class ChatService {
  Dio dio = Api().dio;

  Future<ChatModel>? sendChatMessages(ChatModel chatModel) async {
    Map<String, dynamic> data = {
      "senderId": chatModel.senderId,
      "receiverId": chatModel.receiverId,
      "text": chatModel.text,
    };
    try {
      final response = await dio.post(AppUrls.sendChatEndpoint, data: data);
      if (response.statusCode == 201) {
        final chatResponse = ChatModel.fromJson(response.data);
        return chatResponse;
      }
    } catch (e) {
      rethrow;
    }
    return Object() as ChatModel;
  }

  Future<List<ChatModel>>? getChatMessages(
      String userId, String receiverId) async {
    print("userId $userId receiverId $receiverId");
    try {
      final response = await dio.get(
        'chat/messages?user1=$userId&user2=$receiverId',
      );
      if (response.statusCode == 200) {
        print("'${AppUrls.getChatEndpoint}user1=$userId&user2=$receiverId'");
        final chatResponse = ChatModel.fromJsonList(response.data);
        return chatResponse;
      }
    } catch (e) {
      rethrow;
    }
    return [] as List<ChatModel>;
  }
}
