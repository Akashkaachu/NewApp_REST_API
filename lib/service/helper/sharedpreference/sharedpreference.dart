import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefferenceClass extends GetxController {
  String userUIDKey = "USEREMAILKEY";
  RxString uid = ''.obs;

  Future<bool> saveuserUID(String uid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    log(uid);
    return await sf.setString(userUIDKey, uid);
  }

  Future getUserUID() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final value = sf.getString(userUIDKey);
    log(value ?? '');
    uid.value = value!;
  }
}
