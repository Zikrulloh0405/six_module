import 'package:flutter/material.dart';
import 'package:six_module/services/utils.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({super.key});
  static const String id = "lesson_1";
  @override
  State<Lesson1> createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(textInput: 'Lesson 1'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          //! showToast
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              Utils.showToastFunc('Welcom');
            },
            child: textWidget(textInput: 'Show Toast'),
          ),
          spaceWidget(direction: 1, spaceSize: 10),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              LogService();
            },
            child: textWidget(textInput: 'Show Toast'),
          ),
        ],
      ),
      drawer: drawerWidget(),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.amber, items: [
        BottomNavigationBarItem(
            icon: iconWidget(inputIcon: Icons.home), label: 'First'),
        BottomNavigationBarItem(
            icon: iconWidget(inputIcon: Icons.home), label: 'First'),
      ]),
    );
  }
}
