import 'package:flutter/material.dart';
import 'package:six_module/lesson/lesson_3/task_1.dart';
import 'package:six_module/models/user_model.dart';
import 'package:six_module/services/pref_service.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Task2Lesson3 extends StatefulWidget {
  const Task2Lesson3({super.key});
  static const String id = "lesson_3_task_2";
  @override
  State<Task2Lesson3> createState() => _Task2Lesson3State();
}

class _Task2Lesson3State extends State<Task2Lesson3> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: textWidget(textInput: 'Task 2'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Task1Lesson3.id);
            },
            icon: iconWidget(inputIcon: Icons.arrow_back)),
      ),
      // drawer: drawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //! welcome text
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //! let's get started
                  Container(
                    child: textWidget(
                        textInput: "Let's get Started !",
                        textFontWeight: FontWeight.bold,
                        textFontSize: 25),
                  ),

                  //! create an account text
                  Container(
                    child: textWidget(
                        textInput:
                            "Create an account to Q Allure to get all features",
                        textFontSize: 16,
                        textColor: Colors.grey,
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),

            //! textFields
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //! email textFields
                  textFieldVerification(
                    controller: emailController,
                    hintText: 'Email',
                    textFieldPrefixIcon: Icons.email,
                    ketBoardType: TextInputType.emailAddress,
                  ),
                  spaceWidget(direction: 1, spaceSize: 30),
                  //! phone textfiled
                  textFieldVerification(
                      controller: phoneController,
                      hintText: 'Phone number',
                      textFieldPrefixIcon: Icons.phone_android,
                      ketBoardType: TextInputType.phone),
                  spaceWidget(direction: 1, spaceSize: 30),
                  //! password
                  textFiledConfirm(
                      controller: passwordController, hintText: "Password"),
                  spaceWidget(direction: 1, spaceSize: 30),
                  //! confirm password
                  textFiledConfirm(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password'),
                ],
              ),
            ),

            //! BUTTONS
            Container(
              child: MaterialButton(
                height: 65,
                minWidth: 250,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: const Color(0xFF1551CE),
                onPressed: () {
                  if (isFilled()) {
                    User user = User(
                        userEmail: emailController.text,
                        userPhone: phoneController.text,
                        userPassword: passwordController.text);
                    PrefSertvice.setUserInfo(user);
                    _showSuccessSnackbar();
                  } else {
                    _showErrorSnackbar(
                        "Please fill in all fields and ensure passwords match");
                  }
                },
                child: textWidget(
                    textInput: "Create".toUpperCase(),
                    textColor: Colors.white,
                    textFontWeight: FontWeight.w600),
              ),
            ),

            //! log in text button
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //! Already have an account
                  Container(
                    child: textWidget(
                        textInput: "Already have an account ?",
                        textFontSize: 16),
                  ),
                  //! Log In
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Task1Lesson3.id);
                        },
                        child: textWidget(
                            textInput: "Login here",
                            textFontSize: 16.5,
                            textColor: const Color(0xFF1551CE),
                            textFontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isFilled() {
    if (passwordController.text == confirmPasswordController.text) {
      if (emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        return true;
      }
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

  void _showSuccessSnackbar() {
    final snackBar = SnackBar(
      content: Text('The data saved successfully'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Navigator.pushReplacementNamed(context, Task1Lesson3.id);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
}
