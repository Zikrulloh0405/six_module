import 'package:flutter/material.dart';
import 'package:six_module/widgets/drawer_widget.dart';
import 'package:six_module/widgets/all_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: textWidget(textInput: 'All Routes'),
          centerTitle: true,
        ),
        body: Center(
          child: textWidget(textInput: 'textInput'),
        ),
        drawer: drawerWidget());
  }
}
