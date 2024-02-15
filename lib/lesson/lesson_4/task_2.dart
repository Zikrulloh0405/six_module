import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:six_module/lesson/lesson_4/hive_servise.dart';
import 'package:six_module/lesson/lesson_4/user_list.dart';

import '../../models/user_model.dart';
import '../../widgets/all_widgets.dart';

class Task2Lesson4 extends StatefulWidget {
  const Task2Lesson4({super.key});

  static const String id = "task_2_lesson_4";
  @override
  State<Task2Lesson4> createState() => _Task2Lesson4State();
}

class _Task2Lesson4State extends State<Task2Lesson4> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  bool isLoginned = true;
  void storeUser() async {
    await Hive.openBox('user_account');
    //Use Hive Service
    var user = User(
      userEmail: userEmailController.text,
      userPassword: userPasswordController.text,
      userPhone: userPhoneController.text,
    );
    setState(() {
      HiveService.storeUser(user);
      log(user.toJson().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1A1D39),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! create account text
            Container(
              child: textWidget(
                  textInput:
                      isLoginned ? "Weolcome Back!" : "Create \n Account",
                  textColor: colorWhite,
                  textAlign: TextAlign.center,
                  textFontSize: 27,
                  textFontWeight: FontWeight.w600),
            ),
            isLoginned
                ? textWidget(
                    textInput: 'Sign in to continue', textColor: Colors.white70)
                : const SizedBox.shrink(),
            spaceWidget(direction: 1, spaceSize: 30),
            //!textfields
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  //! user name
                  Container(
                    child: textFieldVerification(
                        controller: userNameController,
                        hintText: 'User Name',
                        prefixIcon: Icons.person_2_outlined),
                  ),

                  //! user email
                  isLoginned
                      ? const SizedBox.shrink()
                      : Container(
                          child: textFieldVerification(
                              inputType: TextInputType.emailAddress,
                              controller: userEmailController,
                              hintText: 'E-Mail',
                              prefixIcon: Icons.email_outlined),
                        ),

                  //! user phone
                  isLoginned
                      ? const SizedBox.shrink()
                      : Container(
                          child: textFieldVerification(
                              inputType: TextInputType.phone,
                              controller: userPhoneController,
                              hintText: "Phone Number",
                              prefixIcon: Icons.phone),
                        ),

                  //! user password
                  Container(
                    child: confirmTextField(
                      controller: userPasswordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_open_outlined,
                    ),
                  ),
                ],
              ),
            ),

            isLoginned
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                        onPressed: () {},
                        child: textWidget(
                            textInput: 'Forgot Password?',
                            textColor: Colors.white60,
                            textFontSize: 18)),
                  )
                : const SizedBox.shrink(),
            spaceWidget(direction: 1, spaceSize: 10),
            //!sign up icon button
            Container(
              child: MaterialButton(
                // splashRadius: 90,
                padding: EdgeInsets.zero,
                elevation: 1,
                shape: const CircleBorder(),
                onPressed: () {
                  storeUser();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const UserList()));
                },
                child: Image.asset(
                  "assets/images/next_button.png",
                  height: 70,
                ),
              ),
            ),
            spaceWidget(direction: 1, spaceSize: 30),
            //! log in text button
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //! Already have an account
                  Container(
                    child: textWidget(
                        textInput: isLoginned
                            ? "Don't have an account ?"
                            : "Already have an account ?",
                        textColor: colorGrey,
                        textFontSize: 16),
                  ),
                  //! Log In
                  TextButton(
                      onPressed: () {
                        isLoginned = !isLoginned;
                        setState(() {});
                      },
                      child: textWidget(
                          textInput: isLoginned ? "SIGN UP" : "SIGN IN",
                          textFontSize: 16.5,
                          textColor: const Color.fromARGB(255, 55, 103, 205),
                          textFontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldVerification(
      {required TextEditingController controller,
      required String hintText,
      required IconData prefixIcon,
      TextInputType? inputType}) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        keyboardType: inputType,
        style: TextStyle(color: colorWhite),
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: colorGrey),
            prefixIcon: iconWidget(inputIcon: prefixIcon, iconColor: colorGrey),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    icon: iconWidget(
                        inputIcon: Icons.clear, iconColor: colorGrey))
                : const SizedBox.shrink()),
      ),
    );
  }

  Widget confirmTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        style: TextStyle(color: colorWhite),
        obscureText: isPasswordVisible,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: colorGrey),
            prefixIcon: iconWidget(inputIcon: prefixIcon, iconColor: colorGrey),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: iconWidget(
                    iconColor: colorGrey,
                    inputIcon: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off))),
      ),
    );
  }
}

var colorWhite = Colors.white;
var colorGrey = Colors.grey;
