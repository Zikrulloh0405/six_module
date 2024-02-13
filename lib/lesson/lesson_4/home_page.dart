import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_4/task_1.dart';
import 'package:six_module/lesson/lesson_4/task_2.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Lesson4HomePage extends StatefulWidget {
  static const String id = "/lesson_4_home_page";
  const Lesson4HomePage({super.key});

  @override
  State<Lesson4HomePage> createState() => _Lesson4HomePageState();
}

class _Lesson4HomePageState extends State<Lesson4HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: drawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.amber,
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Task1Lesson4.id);
                },
                child: textWidget(textInput: 'Task 1'),
              ),
              spaceWidget(direction: 1, spaceSize: 10),
              MaterialButton(
                color: Colors.amber,
                padding: const EdgeInsets.all(20),
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Task2Lesson4.id);
                },
                child: textWidget(textInput: 'Task 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
