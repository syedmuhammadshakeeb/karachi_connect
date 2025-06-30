import 'package:dio/dio.dart';
import 'package:karachi_connect/model/chat_model/chat_model.dart';
import 'package:karachi_connect/services/api_service/api_service.dart';
import 'package:karachi_connect/utils/constants/app_urls.dart';

class ChatService {
  Dio dio = Api().dio;


//   Future<ChatModel>? getChatMessages(String userId) async {

//     Map<String, dynamic> data ={
//   "senderId": "user1_id",
//   "receiverId": "user2_id",
//   "message": "Hello!"
// }
// ;
//     try {
//       final response = await dio.post(AppUrls.sendChatEndpoint,data: data);
//       if (conditions.response.statusCode == 200) {
//         return ChatModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to send chat message');
        
//       }
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

}
