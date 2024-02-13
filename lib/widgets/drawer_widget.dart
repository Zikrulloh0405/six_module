import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_1/lesson_1.dart';
import 'package:six_module/lesson/lesson_2/localization.dart';
import 'package:six_module/lesson/lesson_3/shared_preferences.dart';
import 'package:six_module/lesson/lesson_4/data_base_lesson_4.dart';
import 'package:six_module/models/pages_model.dart';
import 'package:six_module/pages/home_page.dart';
import 'package:six_module/widgets/all_widgets.dart';

Widget drawerWidget() {
  return Builder(builder: (context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.amber,
                child: MaterialButton(
                  height: 40,
                  minWidth: 60,
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: textWidget(
                      textInput: 'Home Page', textColor: Colors.white),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemBuilder: (cntx, i) => _materButtn(pages: _pages[i]),
                    itemCount: _pages.length,
                  )))
        ],
      ),
    );
  });
}

Widget _materButtn({required Pages pages}) {
  return Builder(builder: (context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(70)),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        // color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, pages.nameOfPage);
        },
        child: textWidget(textInput: pages.nameOfPageButton),
      ),
    );
  });
}

final List<Pages> _pages = [
  Pages(nameOfPage: HomePage.id, nameOfPageButton: 'HomePage'),
  Pages(nameOfPage: Lesson1.id, nameOfPageButton: 'Lesson 1'),
  Pages(nameOfPage: LocalizationPage.id, nameOfPageButton: 'Lesson 2'),
  Pages(nameOfPage: SharePreferences.id, nameOfPageButton: 'Lesson 3'),
  Pages(nameOfPage: DataBase.id, nameOfPageButton: "Lesson 4")
];
