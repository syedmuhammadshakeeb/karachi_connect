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


 
}