import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:six_module/lesson/lesson_3/shared_preferences.dart';
import 'package:six_module/lesson/lesson_3/task_2.dart';
import 'package:six_module/services/pref_service.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Task1Lesson3 extends StatefulWidget {
  const Task1Lesson3({super.key});
  static const String id = "lesson_3_task_1";
  @override
  State<Task1Lesson3> createState() => _Task1Lesson3State();
}

class _Task1Lesson3State extends State<Task1Lesson3> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: textWidget(textInput: 'Task 1'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: drawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //! image
                Container(
                    child: SvgPicture.asset(
                  "assets/images/log_in_image.svg",
                  height: 200,
                  width: 200,
                )),
                spaceWidget(direction: 1, spaceSize: 15),
                //! welcome text
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //! let's get started
                      Container(
                        child: textWidget(
                            textInput: "Welcome back!",
                            textFontWeight: FontWeight.bold,
                            textFontSize: 25),
                      ),

                      //! create an account text
                      Container(
                        child: textWidget(
                            textInput:
                                "Login to your existant account in Q Allure",
                            textFontSize: 16,
                            textColor: Colors.grey,
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
                spaceWidget(direction: 1, spaceSize: 15),

                //! textfileds
                Container(
                  child: Column(
                    children: [
                      //! email
                      textFieldVerification(
                          controller: emailController,
                          hintText: 'Email',
                          textFieldPrefixIcon: Icons.email,
                          ketBoardType: TextInputType.emailAddress),
                      spaceWidget(direction: 1, spaceSize: 20),
                      //!password
                      textFiledConfirm(
                          controller: passwordController, hintText: 'Password')
                    ],
                  ),
                ),
                spaceWidget(direction: 1, spaceSize: 15),

                //! forgot password text button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: textWidget(
                          textInput: 'Forgot Password', textFontSize: 17),
                    ),
                  ],
                ),
                spaceWidget(direction: 1, spaceSize: 15),

                //! login button
                Container(
                  child: MaterialButton(
                    height: 50,
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: const Color(0xFF1551CE),
                    onPressed: () async {
                      setState(() {
                        _attemptLogin();
                      });
                    },
                    child: textWidget(
                        textInput: "Log in".toUpperCase(),
                        textColor: Colors.white,
                        textFontWeight: FontWeight.w600),
                  ),
                ),
                spaceWidget(direction: 1, spaceSize: 30),
                //! facebook and google
                Container(
                  child: Column(
                    children: [
                      textWidget(
                          textInput: "Or connect using",
                          textColor: Colors.grey),
                      spaceWidget(direction: 1, spaceSize: 10),
                      Row(
                        children: [
                          //! facebook button
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue[900]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  iconWidget(
                                      inputIcon: Icons.facebook,
                                      iconColor: Colors.white),
                                  textWidget(
                                      textInput: "Facebook",
                                      textColor: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(direction: 0, spaceSize: 20),
                          //! google button
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.redAccent),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/google_icon.svg",
                                    color: Colors.white,
                                    height: 30,
                                    width: 30,
                                  ),
                                  spaceWidget(direction: 0, spaceSize: 5),
                                  textWidget(
                                      textInput: "Google",
                                      textColor: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                spaceWidget(direction: 1, spaceSize: 30),

                //! sign up text button
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! Already have an account
                      Container(
                        child: textWidget(
                            textInput: "Don't have an account ?",
                            textFontSize: 16),
                      ),
                      //! Log In
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Task2Lesson3.id);
                            },
                            child: textWidget(
                                textInput: "Sign Up",
                                textFontSize: 16.5,
                                textColor: const Color(0xFF1551CE),
                                textFontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _attemptLogin() async {
    if (isFilled()) {
      final user = await PrefSertvice.getUserInfo();

      if (user != null) {
        if (user.userEmail == emailController.text &&
            user.userPassword == passwordController.text) {
          Navigator.pushReplacementNamed(context, SharePreferences.id);
        } else {
          _showErrorSnackbar("Incorrect email or password");
        }
      } else {
        _showErrorSnackbar("User not found. Please sign up.");
      }
    } else {
      _showErrorSnackbar("Please fill in all fields");
    }
  }

  void _showErrorSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool isFilled() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Widget textFieldVerification({
    required TextEditingController controller,
    required String hintText,
    required IconData textFieldPrefixIcon,
    required TextInputType ketBoardType,
  }) {
    return Container(
      child: TextField(
        keyboardType: ketBoardType,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: iconWidget(
                inputIcon: textFieldPrefixIcon, iconColor: Colors.grey),
            suffixIcon: emailController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: iconWidget(inputIcon: Icons.close))
                : const SizedBox.shrink(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: .1),
                borderRadius: BorderRadius.circular(40)),
            focusedBorder: const OutlineInputBorder(
                // borderRadius: BorderRadius.circular(40)
                borderSide: BorderSide(width: 1, color: Colors.black))),
      ),
    );
  }

  Widget textFiledConfirm({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: isPasswordVisible,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: iconWidget(
                inputIcon: Icons.lock_outline, iconColor: Colors.grey),
            suffixIcon: IconButton(
              icon: iconWidget(
                  iconColor: Colors.grey,
                  inputIcon: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: .1, color: Colors.grey),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(width: .1))),
      ),
    );
  }
}
