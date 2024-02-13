import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:six_module/lesson/lesson_1/lesson_1.dart';
import 'package:six_module/lesson/lesson_2/localization.dart';
import 'package:six_module/lesson/lesson_2/task_1.dart';
import 'package:six_module/lesson/lesson_2/task_2.dart';
import 'package:six_module/lesson/lesson_3/shared_preferences.dart';
import 'package:six_module/lesson/lesson_3/task_1.dart';
import 'package:six_module/lesson/lesson_3/task_2.dart';
import 'package:six_module/lesson/lesson_4/data_base_lesson_4.dart';
import 'package:six_module/lesson/lesson_4/home_page.dart';
import 'package:six_module/lesson/lesson_4/task_1.dart';
import 'package:six_module/lesson/lesson_4/task_2.dart';
import 'package:six_module/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('user_account');

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
      Locale('fr', 'FR'),
      Locale('ko', 'KR'),
      Locale('ja', 'JP')
    ],
    path: "assets/localization",
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Lesson4HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        Lesson1.id: (context) => const Lesson1(),
        LocalizationPage.id: (context) => const LocalizationPage(),
        Task1.id: (context) => const Task1(),
        Task2.id: (context) => const Task2(),
        SharePreferences.id: (context) => const SharePreferences(),
        Task1Lesson3.id: (context) => const Task1Lesson3(),
        Task2Lesson3.id: (context) => const Task2Lesson3(),
        DataBase.id: (context) => const DataBase(),
        Lesson4HomePage.id: (context) => const Lesson4HomePage(),
        Task1Lesson4.id: (context) => const Task1Lesson4(),
        Task2Lesson4.id: (context) => const Task2Lesson4(),
      },
    );
  }
}
