import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/getx/snackbar_getx_controller/snackbar_getx_controller.dart';
import 'package:mini/screens/sign_in/function/funtion_sign_in.dart';
import 'package:mini/screens/sign_in/sign_in.dart';
import 'package:mini/service/firebase/firebase_auth/firebase_auth.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController emailEditingsController = TextEditingController();
  final TextEditingController passWordEditingsController =
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
          builder: (context, isemailBool, child) {
            return Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.asset(
                      'assets/images/newPaper.jpg',
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
                          height: 500,
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
                                  textEditingController:
                                      emailEditingsController,
                                  icon: Icons.email_outlined,
                                  suffixIconColor:
                                      isemailBool == true ? kGreen : kRed,
                                  suffixIcon: isemailBool == null
                                      ? null
                                      : isemailBool == true
                                          ? Icons.task_alt
                                          : Icons.cancel,
                                  hintText: "akash@gmail.com",
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
                                  child: ValueListenableBuilder(
                                      valueListenable: isEyeboolNotifier,
                                      builder: (context, isEyeBools, child) {
                                        return TextFormFieldWidget(
                                          textEditingController:
                                              passWordEditingsController,
                                          icon: Icons.key,
                                          suffixIcon: isEyeBools == true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          onTapSuffixIcon: () {
                                            isEyeboolNotifier.value =
                                                !isEyeboolNotifier.value;
                                          },
                                          obscureText: isEyeBools,
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
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: Get.width,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            if (isemailBool == null ||
                                                isemailBool == false) {
                                              CustomSnackBarController()
                                                  .showCustumSnackbar(
                                                      'Oops',
                                                      'Invalid Email',
                                                      ContentType.warning);
                                            } else if (isemailBool == true) {
                                              await AuthServiceClass()
                                                  .createteUserAccount(
                                                      emailEditingsController
                                                          .text,
                                                      passWordEditingsController
                                                          .text);
                                            }
                                          }
                                        },
                                        child: const Text(
                                          "SignUp",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Already have an Account?",
                                      style: TextStyle(
                                          color: kWhite,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          emailNotifier.value = null;
                                          Get.off(() => SignInPage());
                                        },
                                        child: const Text(
                                          "SignIn ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: kBlack,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
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
