import 'package:flutter/foundation.dart';

ValueNotifier<bool?> emailNotifier = ValueNotifier(null);
ValueNotifier<bool> isEyeboolNotifier = ValueNotifier(true);
void emailValidationFun(String email) {
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    emailNotifier.value = true;
  } else if (email.isEmpty) {
    emailNotifier.value = null;
  } else {
    emailNotifier.value = false;
  }
}

void signInFun() {}
