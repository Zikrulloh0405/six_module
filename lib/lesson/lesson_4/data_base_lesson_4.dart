import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:six_module/lesson/lesson_4/task_1.dart';
import 'package:six_module/lesson/lesson_4/task_2.dart';
import 'package:six_module/services/hive_service.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class DataBase extends StatefulWidget {
  const DataBase({super.key});
  static const String id = "lesson_4_data_base_page";

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  // final _shopingBox = Hive.box('flutter_hive_base');

  // Future<void> _creatItem(Map<String, dynamic> newItem) async {
  //   await _shopingBox.add(newItem);
  //   _refreshItems();
  // }

  // Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
  //   await _shopingBox.put(itemKey, item);
  //   _refreshItems();
  // }

  // Future<void> _deleteItem(int itemKey) async {
  //   await _shopingBox.delete(itemKey);
  //   _refreshItems();

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: textWidget(textInput: "An Item has been deleted"),
  //     backgroundColor: Colors.amber,
  //     showCloseIcon: true,
  //     closeIconColor: Colors.black,
  //   ));
  // }

  // void _refreshItems() async {
  //   final data = _shopingBox.keys.map((key) {
  //     final item = _shopingBox.get(key);
  //     return {"key": key, "name": item["name"], "quantity": item["quantity"]};
  //   }).toList();

  //   setState(() {
  //     _items = data.reversed.toList();
  //     // print("${_items.length}");
  //   });
  // }

  // void _showForm(BuildContext ctx, int? itemKey) async {
  //   if (itemKey != null) {
  //     final existingItem =
  //         _items.firstWhere((element) => element['key'] == itemKey);
  //     nameController.text = existingItem['name'];
  //     quantityController.text = existingItem['quantity'];
  //   }

  //   showModalBottomSheet(
  //       context: ctx,
  //       elevation: 5,
  //       isScrollControlled: true,
  //       builder: (_) => Container(
  //             padding: EdgeInsets.only(
  //                 bottom: MediaQuery.of(ctx).viewInsets.bottom,
  //                 top: 15,
  //                 right: 15,
  //                 left: 15),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 TextField(
  //                   controller: nameController,
  //                   decoration: const InputDecoration(hintText: 'Name'),
  //                 ),
  //                 spaceWidget(direction: 1, spaceSize: 10),
  //                 TextField(
  //                   controller: quantityController,
  //                   keyboardType: TextInputType.number,
  //                   decoration: const InputDecoration(hintText: 'Quantity'),
  //                 ),
  //                 spaceWidget(direction: 1, spaceSize: 10),
  //                 ElevatedButton(
  //                     onPressed: () {
  //                       if (itemKey == null) {
  //                         _creatItem({
  //                           "name": nameController.text,
  //                           "quantity": quantityController.text
  //                         });
  //                       }

  //                       if (itemKey != null) {
  //                         _updateItem(itemKey, {
  //                           "name": nameController.text.trim(),
  //                           "quantity": quantityController.text.trim(),
  //                         });
  //                       }

  //                       Navigator.pop(context);
  //                     },
  //                     child: textWidget(
  //                         textInput:
  //                             itemKey == null ? "Create New" : "Update")),
  //                 spaceWidget(direction: 1, spaceSize: 10),
  //               ],
  //             ),
  //           ));
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _refreshItems();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(textInput: 'Hive Data Base'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [],
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Task1Lesson4.id);
                  },
                  child: textWidget(textInput: 'Task 1'),
                ),
                MaterialButton(
                  color: Colors.amberAccent,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Task2Lesson4.id);
                  },
                  child: textWidget(textInput: 'Task 2'),
                )
              ]),
        ),
      ),
      drawer: drawerWidget(),
      // body: ListView.builder(
      //     itemCount: _items.length,
      //     itemBuilder: (_, index) {
      //       final currentItem = _items[index];
      //       return Card(
      //         color: Colors.orange.shade100,
      //         margin: EdgeInsets.all(10),
      //         elevation: 3,
      //         child: ListTile(
      //           title: textWidget(textInput: currentItem["name"]),
      //           subtitle: textWidget(textInput: currentItem["quantity"]),
      //           trailing: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     _showForm(context, currentItem["key"]);
      //                   },
      //                   icon: iconWidget(inputIcon: Icons.edit)),
      //               IconButton(
      //                   onPressed: () {
      //                     _deleteItem(currentItem["key"]);
      //                   },
      //                   icon: iconWidget(inputIcon: Icons.delete)),
      //             ],
      //           ),
      //         ),
      //       );
      //     }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showForm(context, null);
      //   },
      //   child: iconWidget(inputIcon: Icons.add),
      // ),
    );
  }
}
