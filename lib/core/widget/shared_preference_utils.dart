//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferenceUtils {
//   static late SharedPreferences sharedPreferences;
//
//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<bool> saveData({required String key, required dynamic value}) {
//     if (value is int) {
//       return sharedPreferences.setInt(key, value);
//     } else if (value is double) {
//       return sharedPreferences.setDouble(key, value);
//     } else if (value is String) {
//       return sharedPreferences.setString(key, value);
//     } else {
//       return sharedPreferences.setBool(key, value);
//     }
//   }
//
//   static Object? getData({required String key}) {
//     return sharedPreferences.get(key);
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     return await sharedPreferences.remove(key);
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<bool> saveData(String key, dynamic value) {
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else {
      return prefs.setStringList(key, value);
    }
  }

  static Object? loadData(String key) {
    return prefs.get(key);
  }

  static Future<bool> removeData(String key) async {
    return await prefs.remove(key);
  }
}
