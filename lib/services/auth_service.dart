import 'dart:developer';
import 'dart:io';

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
      File? profileImage,
      int? numberOfProjectsInvestedIn}) async {
    // Map<String, dynamic> data = {
    //   "name": name ?? "",
    //   "email": email ?? "",
    //   "password": password ?? "",
    //   "cnic": cnic == null && cnic?.isEmpty == true ? "4210112345678" : cnic,
    //   "phone": phone ?? "",
    //   "role": role,
    //   "ntn": ntn ?? "",
    //   "numberOfProjectsInvestedIn": numberOfProjectsInvestedIn ?? 0,
    //   "profileImage": profileImage
    // };
    log("data is ${profileImage?.path}");
    FormData data = FormData.fromMap({
      "name": name ?? "",
      "email": email ?? "",
      "password": password ?? "",
      "cnic": cnic ?? "4210112345678",
      "phone": phone ?? "",
      "role": role,
      "ntn": ntn ?? "",
      "numberOfProjectsInvestedIn": numberOfProjectsInvestedIn ?? 0,
    });
    if (profileImage != null) {
      data.files.add(
        MapEntry(
          "profileImage",
          await MultipartFile.fromFile(
            profileImage.path,
            filename: "profile.jpg",
          ),
        ),
      );
    }

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

  Future<UserModel>? getuserApi({String? id}) async {
    try {
      final response = await dio.get("users/:$id");
      if (response.statusCode == 200) {
        final userResponse = UserModel.fromJson(response.data);
        return userResponse;
      }
    } catch (e) {
      rethrow;
    }
    return Object() as UserModel;
  }
}
