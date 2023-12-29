import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_2/task_1.dart';
import 'package:six_module/lesson/lesson_2/task_2.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({super.key});
  static const String id = "lesson_2_localization";
  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(textInput: 'Lesson 2'),
        centerTitle: true,
      ),
      drawer: drawerWidget(),
      endDrawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: [
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Task1.id);
                          },
                          child: textWidget(textInput: 'Task_1'),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Task2.id);
                          },
                          child: textWidget(textInput: 'Task_2'),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                MaterialButton(
                  minWidth: 250,
                  color: Colors.blue,
                  onPressed: () {},
                  child: textWidget(textInput: 'str_pacages'),
                ),
                MaterialButton(
                  minWidth: 250,
                  color: Colors.blue,
                  onPressed: () {},
                  child: textWidget(textInput: 'str_localization'),
                ),
                MaterialButton(
                  minWidth: 250,
                  color: Colors.blue,
                  onPressed: () {},
                  child: textWidget(textInput: 'str_local_database'),
                ),
                MaterialButton(
                  minWidth: 250,
                  color: Colors.blue,
                  onPressed: () {},
                  child: textWidget(textInput: 'str_networking'),
                ),
                spaceWidget(direction: 1, spaceSize: 10),
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
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
