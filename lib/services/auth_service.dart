import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:karachi_connect/model/user_model/user_model.dart';
import 'package:karachi_connect/services/api_service/api_service.dart';
import 'package:karachi_connect/utils/constants/app_urls.dart';

class AuthService {
  Dio dio = Api().dio;

  Future signUpApi(
      {required String role,
      String? email,
      String? password,
      String? name,
      String? cnic,
      String? phone,
      String? ntn,
      int? numberOfProjectsInvestedIn}) async {
    Map<String, dynamic> data = {
      "name": name ?? "",
      "email": email ?? "",
      "password": password ?? "",
      "cnic": cnic ?? "4210112345678",
      "phone": phone ?? "",
      "role": role,
      "ntn": ntn ?? "",
      "numberOfProjectsInvestedIn": numberOfProjectsInvestedIn ?? 0
    };

    try {
      final response = await dio.post(AppUrls.signupEndpoint, data: data);

      if (response.statusCode == 201) {
        log("response====>${response.data}");
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel>? loginApi({String? email, String? password}) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    try {
      final response = await dio.post(AppUrls.loginEndpoint, data: data);
      if (response.statusCode == 200) {
        log("response====>${response.data}");
        final userResponse = UserModel.fromJson(response.data["user"]);
        return userResponse;
      }
    } catch (e) {
      rethrow;
    }
    return Object() as UserModel;
  }
}
