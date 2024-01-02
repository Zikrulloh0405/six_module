import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:six_module/models/user_model.dart';

class PrefSertvice {
  static SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;

  // static storeName(String name) async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("name", name);
  // }

  // static Future<String?> loadName() async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("name");
  // }

  // static Future<bool> removeName() async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.remove("name");
  // }

  static saveUser(String user) async {
    await prefs.setString("user", user);
  }

  static Future<String?> loadUser() async {
    return prefs.getString("user");
  }

  static Future<bool> removeUser() async {
    return prefs.remove("user");
  }

  static Future setUserInfo(User user) async {
    var prefs = await SharedPreferences.getInstance();

    final counterInfo = User(
      userEmail: user.userEmail,
      userPhone: user.userPhone,
      userPassword: user.userPassword
    );

    prefs.setString("user", json.encode(counterInfo));
  }

  static Future<User?> getUserInfo() async {
    var prefs = await SharedPreferences.getInstance();
    final userInfo = prefs.getString("user");
    if (userInfo == null) return null;

    return User.fromJson(json.decode(userInfo));
  }
}
