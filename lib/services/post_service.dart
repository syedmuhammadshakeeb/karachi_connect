import 'package:dio/dio.dart';
import 'package:karachi_connect/model/post_model/post_model.dart';
import 'package:karachi_connect/services/api_service/api_service.dart';
import 'package:karachi_connect/utils/constants/app_urls.dart';

class PostService {
  Dio dio = Api().dio;

  Future<PostModel>? createPost({
    String? title,
    String? description,
    String? summery,
  }) async {
    Map<String, dynamic> data = {
      "title": title ?? "",
      "summary": summery ?? "",
      "description": description ?? "",
      "investorNeeded": true,
      "developersNeeded": false
    };
    try {
      final response = await dio.post(AppUrls.createPostEndpoint, data: data);
      if (response.statusCode == 201) {
        // Handle success
        final postResponse = PostModel.fromJson(response.data);
        return postResponse;
      }
    } catch (e) {
      rethrow;
    }
    return Object() as PostModel; 
  }
}
