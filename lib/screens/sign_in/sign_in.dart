import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/getx/snackbar_getx_controller/snackbar_getx_controller.dart';
import 'package:mini/screens/sign_in/function/funtion_sign_in.dart';
import 'package:mini/screens/sign_up/sign_up.dart';
import 'package:mini/service/firebase/firebase_auth/firebase_auth.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passWordEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    String greeting;
    if (currentHour >= 0 && currentHour < 12) {
      greeting = 'Good Morning ☀';
    } else if (currentHour >= 12 && currentHour < 17) {
      greeting = 'Good Afternoon 🌤';
    } else if (currentHour >= 17 && currentHour < 21) {
      greeting = 'Good Evening 🌙';
    } else {
      greeting = 'Good Night 🌜';
    }
    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: ValueListenableBuilder(
          valueListenable: emailNotifier,
          builder: (context, isEmail, child) {
            return Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.asset(
                      'assets/images/newPaperSignUp.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Container(
                          height: 505,
                          width: 300,
                          decoration: BoxDecoration(
                              color: lightBlueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  greeting,
                                  style: const TextStyle(
                                      color: kWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sizedHeigtBox15,
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      color: kBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormFieldWidget(
                                  onChanged: (value) {
                                    emailValidationFun(value);
                                  },
                                  textEditingController: emailEditingController,
                                  icon: Icons.email_outlined,
                                  suffixIcon: isEmail == null
                                      ? null
                                      : isEmail == true
                                          ? Icons.task_alt
                                          : Icons.cancel,
                                  suffixIconColor:
                                      isEmail == true ? kGreen : kRed,
                                  hintText: "kannan@gmail.com",
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                ),
                                sizedHeigtBox15,
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                      color: kBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: isEyeboolNotifier,
                                          builder:
                                              (content, isBoolObscure, child) {
                                            return TextFormFieldWidget(
                                              obscureText: isBoolObscure,
                                              textEditingController:
                                                  passWordEditingController,
                                              icon: Icons.key,
                                              onTapSuffixIcon: () {
                                                isEyeboolNotifier.value =
                                                    !isEyeboolNotifier.value;
                                                //or
                                                // isBoolObscure == true
                                                //     ? isEyeboolNotifier.value = false
                                                //     : isEyeboolNotifier.value = true;
                                              },
                                              suffixIcon: isBoolObscure == true
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility,
                                              hintText: "Password",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Enter your Password";
                                                } else if (value.length < 6) {
                                                  return "Enter Atleast 6 strong password";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            );
                                          }),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                          width: Get.width,
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  if (isEmail == null ||
                                                      isEmail == false) {
                                                    CustomSnackBarController()
                                                        .showCustumSnackbar(
                                                            'Oops',
                                                            'Invalid Email',
                                                            ContentType
                                                                .warning);
                                                  } else if (isEmail == true) {
                                                    await AuthServiceClass().signIn(
                                                        emailEditingController
                                                            .text,
                                                        passWordEditingController
                                                            .text);
                                                  }
                                                }
                                              },
                                              child: const Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                          color: kWhite,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          emailNotifier.value = null;
                                          Get.off(() => SignUpPage());
                                        },
                                        child: const Text(
                                          "Signup",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: kBlack,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "OR ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: kWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      sizedHeigtBox5,
                                      SizedBox(
                                        width: Get.width,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              AuthServiceClass().googleSignUp();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/google (1).png',
                                                  width: 20,
                                                ),
                                                sizedWidthBox5,
                                                const Text(
                                                  "Sign-In with Google",
                                                  style: TextStyle(
                                                      color: kBlack,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              )
            ]);
          }),
    ));
  }
}
