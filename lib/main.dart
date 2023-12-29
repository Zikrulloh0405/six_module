import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_1/lesson_1.dart';
import 'package:six_module/lesson/lesson_2/localization.dart';
import 'package:six_module/lesson/lesson_2/task_1.dart';
import 'package:six_module/lesson/lesson_2/task_2.dart';
import 'package:six_module/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        Lesson1.id: (context) => const Lesson1(),
        LocalizationPage.id: (context) => const LocalizationPage(),
        Task1.id: (context) => const Task1(),
        Task2.id: (context) => const Task2()
      },
    );
  }
}
