import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});
  static const String id = "lesson_2_task_1";
  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: textWidget(textInput: 'Task_1'),
        centerTitle: true,
      ),
      drawer: drawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textWidget(textInput: 'str_welcome'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  context.setLocale(
                    const Locale('en', 'US'),
                  );
                },
                child: textWidget(textInput: 'English'),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  context.setLocale(const Locale('uz', 'UZ'));
                },
                child: textWidget(textInput: 'Uzbek'),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  context.setLocale(const Locale('ru', 'RU'));
                },
                child: textWidget(textInput: 'Russian'),
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  context.setLocale(const Locale('fr', 'FR'));
                },
                child: textWidget(textInput: 'French'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
