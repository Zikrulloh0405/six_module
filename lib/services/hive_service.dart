// import 'package:hive/hive.dart';
// import 'package:six_module/models/user_model.dart';

// class HiveService  {
//   static var box = Hive.box("flutter_hive_base");

//   static void storeUser(User user) async {
//     box.put("user", user.toJson());
//   }

//   static User loadUser() {
//     var user = User.fromJson(box.get("user"));
//     return user;
//   }

//   static void removeUser() async {
//     box.delete("user");
//   }
// }
