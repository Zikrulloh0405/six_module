import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});
  static const String id = "task_2_lesson_2";
  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(textInput: 'Task 2'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: drawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: textWidget(
                    textInput: "str_flutter_text",
                    textAlign: TextAlign.center)),
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
                // spaceWidget(direction: 0, spaceSize: 10),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    context.setLocale(const Locale('ko', 'KR'));
                  },
                  child: textWidget(textInput: 'Korean'),
                ),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    context.setLocale(const Locale('ja', 'JP'));
                  },
                  child: textWidget(textInput: 'Japanese'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
