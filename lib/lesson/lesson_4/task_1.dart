import 'package:flutter/material.dart';
import 'package:six_module/widgets/all_widgets.dart';
import 'package:six_module/widgets/drawer_widget.dart';

class Task1Lesson4 extends StatefulWidget {
  const Task1Lesson4({super.key});

  static const String id = "task_1_lesson_4";
  @override
  State<Task1Lesson4> createState() => _Task1Lesson4State();
}

class _Task1Lesson4State extends State<Task1Lesson4> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoginned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        color: const Color.fromRGBO(7, 127, 123, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! app qisimi
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, bottom: 40),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoginned
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CircleAvatar(
                              child: iconWidget(inputIcon: Icons.person)),
                        )
                      : const SizedBox.shrink(),
                  textWidget(
                      textInput: 'Welcome',
                      textColor: const Color.fromARGB(250, 87, 209, 205)),
                  spaceWidget(direction: 1, spaceSize: 10),
                  textWidget(
                      textInput: isLoginned ? 'Sign On' : "Sign Up",
                      textColor: Colors.white,
                      textFontSize: 35,
                      textFontWeight: FontWeight.bold),
                ],
              ),
            ),

            //! past qism
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! emaill
                    textWidget(
                        textInput: "Email",
                        textFontSize: 20,
                        textFontWeight: FontWeight.w600),
                    const TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: .5)),
                          hintText: 'Urmail@gmail.com',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),

                    //! number
                    isLoginned
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(
                                    textInput: "Number",
                                    textFontSize: 20,
                                    textFontWeight: FontWeight.w600),
                                const TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: .5)),
                                      hintText: "000-796-456",
                                      hintStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                    spaceWidget(direction: 1, spaceSize: 20),
                    //! password
                    textWidget(
                        textInput: "Password",
                        textFontSize: 20,
                        textFontWeight: FontWeight.w600),
                    const TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: .5)),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),

                    //! forgor password
                    isLoginned
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {},
                                  child: textWidget(
                                      textInput: "Forgot Password ?",
                                      textFontSize: 17.9,
                                      textColor: Colors.grey)),
                            ),
                          )
                        : const SizedBox.shrink(),
                    spaceWidget(direction: 1, spaceSize: 20),
                    Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: const Color.fromRGBO(7, 127, 123, 1),
                        onPressed: () {},
                        child: textWidget(
                            textInput: isLoginned ? "Sign In" : "Sign Up",
                            textColor: Colors.white,
                            textFontWeight: FontWeight.bold),
                      ),
                    ),

                    //! dont' have anaccount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                            textInput: isLoginned
                                ? "Don't have an account ?"
                                : "Already have an account ?",
                            textColor: Colors.grey,
                            textFontSize: 17.9),
                        TextButton(
                            onPressed: () {
                              isLoginned = !isLoginned;
                              setState(() {});
                            },
                            child: textWidget(
                                textInput: isLoginned ? "Sign Up" : "Sign In",
                                textFontWeight: FontWeight.bold,
                                textFontSize: 18,
                                textColor:
                                    const Color.fromRGBO(7, 127, 123, 1)))
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
