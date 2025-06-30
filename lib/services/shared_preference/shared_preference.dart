import 'dart:convert';

import 'package:karachi_connect/model/post_model/post_model.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {

  static Future setString(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(key, value);
  }
  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

static Future<void> clearAll() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

static Future<void> savePostListLocally(List<PostModel> myList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList =
        myList.map((item) => item.toJson()).toList();
    String jsonString =
        jsonEncode(jsonList); 
    await prefs.setString(Enviroment.getPostLocally, jsonString);
  }
 static Future<List<PostModel>> getPostListLocally() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString(Enviroment.getPostLocally);
  
  if (jsonString != null) {
    List<dynamic> jsonResponse = jsonDecode(jsonString);
    return jsonResponse.map((item) => PostModel.fromJson(item)).toList();
  } else {
    return []; 
  }
}



 
}