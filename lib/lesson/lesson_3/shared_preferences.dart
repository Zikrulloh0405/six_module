import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_3/task_1.dart';
import 'package:six_module/lesson/lesson_3/task_2.dart';
import 'package:six_module/models/user_model.dart';
import 'package:six_module/services/pref_service.dart';
import 'package:six_module/services/secure_service.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class SharePreferences extends StatefulWidget {
  const SharePreferences({super.key});
  static const String id = "lesson_3_shared_opreferences";
  @override
  State<SharePreferences> createState() => _SharePreferencesState();
}

class _SharePreferencesState extends State<SharePreferences> {
  @override
  void initState() {
    super.initState();
    // var user = User('111', 'AAA', 'aaa@.com');
    // PrefSertvice.storeUser(user);
    // PrefSertvice.loadUser().then((value) => print(value?.id));
    // print(a);

    SecureService.storeApiKey("pdpAcademy");
    SecureService.loadApiKey().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: textWidget(textInput: 'Lesson 3'),
        centerTitle: true,
      ),
      drawer: drawerWidget(),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Task1Lesson3.id);
              },
              child: textWidget(textInput: 'Task 1'),
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Task2Lesson3.id);
              },
              child: textWidget(textInput: 'Task 2'),
            )
          ],
        ),
      ),
    );
  }
}
