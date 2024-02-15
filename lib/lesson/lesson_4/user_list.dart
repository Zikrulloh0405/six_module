import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_4/hive_servise.dart';

import '../../models/user_model.dart';
import '../../services/hive_service.dart';

class UserList extends StatefulWidget {
  static String id = "user_list";
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  void getUser() {
    // Load user from local storage
    User user = HiveService.loadUser();
    String result = User.fromJson(user.toJson()).toString();
    log(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    // var users = getUser();
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Welcome Home!"),
        centerTitle: true,
      ),
    );
  }
}
