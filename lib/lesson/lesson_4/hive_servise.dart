import 'package:hive/hive.dart';

import '../../models/user_model.dart';

class HiveService  {
  static var box = Hive.box('user_account');

  static void storeUser(User user) async {
    box.put("user", user.toJson());
  }

  static void saveAsString(List<String> userData) {
    box.put("user", userData);
  }

  static User loadUser() {
    User user = User.fromJson(box.get("user"));
    return user;
  }

   static List<String> getUserDataFromLocal() {
    List<String> userData = box.get("user", defaultValue: []);
    return userData;
  }
  
  static void removeUser() async {
    box.delete("user");
  }
}
