import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_5/http_network_service.dart';
import 'package:six_module/lesson/lesson_5/network_service.dart';
import 'package:six_module/lesson/lesson_5/post_model.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

import 'user_model_lesson5.dart';

class Lesson5HomePage extends StatefulWidget {
  static const String id = "lesson_5_home_page";
  const Lesson5HomePage({super.key});

  @override
  State<Lesson5HomePage> createState() => _Lesson5HomePageState();
}

class _Lesson5HomePageState extends State<Lesson5HomePage> {
  @override
  void initState() {
    super.initState();
    _apiGet();
    // var post = Post(id: 1, title: 'PDP', body: 'Academy3', userId: 101);
    // _apiPost(post);
    // _apiUpdate(post);
    // _apiDelete(post);
  }

  //! Class work
  /*
  void _apiGet() {
    NetworkService.GET(NetworkService.API_GET, NetworkService.paramsEmpty())
        .then((value) => print(value));
  }

  void _apiPost(Post post) {
    NetworkService.POST(
            NetworkService.API_CREATE, NetworkService.paramsCreate(post))
        .then((value) => print(value));
  }

  void _apiUpdate(Post post) {
    NetworkService.PUT(NetworkService.API_UPDATE + post.id.toString(),
            NetworkService.paramsUpdate(post))
        .then((value) => print(value));
  }

  void _apiDelete(Post post) {
    NetworkService.DEL(NetworkService.API_DELETE+post.id.toString(), NetworkService.paramsEmpty())
        .then((value) => print(value));
  }
  */

  @override
  Widget build(BuildContext context) {
    var employee = Datum(
        id: 2,
        employeeName: 'Zikrulloh',
        employeeAge: 20,
        employeeSalary: 10000,
        profileImage: '');
    return Scaffold(
      appBar: AppBar(
        title: textWidget(textInput: 'Lesson 5'),
      ),
      drawer: drawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.amber,
                  minWidth: 100,
                  onPressed: () {
                    _apiPost(employee);
                  },
                  child: iconWidget(inputIcon: Icons.add),
                ),
                MaterialButton(
                  color: Colors.amber,
                  minWidth: 100,
                  onPressed: () {
                    _apiGet();
                  },
                  child: iconWidget(inputIcon: Icons.download),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.amber,
                  minWidth: 100,
                  onPressed: () {
                    var employee1 = Datum(
                        id: 2,
                        employeeName: 'Zikrulloh',
                        employeeAge: 19,
                        employeeSalary: 10000,
                        profileImage: '');
                    _apiPut(employee1);
                  },
                  child: iconWidget(inputIcon: Icons.update),
                ),
                MaterialButton(
                  color: Colors.amber,
                  minWidth: 100,
                  onPressed: () {
                    _apiDelete(employee);
                  },
                  child: iconWidget(inputIcon: Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //! Home Task Part
  void _apiGet() {
    HomeNetworkService.GET(
            HomeNetworkService.apiGet, HomeNetworkService.paramsEmpty())
        .then((value) => print(value));
  }

  void _apiPost(Datum employee) {
    HomeNetworkService.POST(NetworkService.API_CREATE,
            HomeNetworkService.paramsCreate(employee))
        .then((value) => print(value));
  }

  void _apiPut(Datum employee) {
    HomeNetworkService.PUT(HomeNetworkService.apiGet + employee.id.toString(),
            HomeNetworkService.paramsEmpty())
        .then((value) => print(value));
  }

  void _apiDelete(Datum employee) {
    HomeNetworkService.DELETE(
            NetworkService.API_CREATE + employee.id.toString(),
            HomeNetworkService.paramsCreate(employee))
        .then((value) => print(value));
  }
}
