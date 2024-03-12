import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini/getx/snackbar_getx_controller/snackbar_getx_controller.dart';
import 'package:mini/presentations/widgets/bottom_navigation_bar.dart/bottom_navigation_bar.dart';
import 'package:mini/service/firebase/firebase_db/firebase_db.dart';
import 'package:mini/service/helper/sharedpreference/sharedpreference.dart';

class AuthServiceClass {
  final SharedPrefferenceClass sharedController =
      Get.put(SharedPrefferenceClass());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//creating   account   in   firebase(signUp)
  Future createteUserAccount(String email, String password) async {
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await FirebaseDatabaseClass(uid: user.uid).saveUserData(email);
        sharedController.saveuserUID(user.uid);
        CustomSnackBarController().showCustumSnackbar(
            'Welcome', 'Successfully registered', ContentType.success);
        Get.off(() => const BottomNavigatioBarScreen());
      } else {
        CustomSnackBarController().showCustumSnackbar(
            'Oops', 'You have already have an account ', ContentType.failure);
      }
    } catch (e) {
      print(e);
      CustomSnackBarController().showCustumSnackbar(
          'Oops',
          e.toString().replaceAll('[firebase_auth/email-already-in-use] ', ''),
          ContentType.failure);
    }
  } //for   signIn

  Future signIn(String email, String password) async {
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        final getShapShort =
            await FirebaseDatabaseClass(uid: user.uid).gettingUserData();
        sharedController.saveuserUID(user.uid);
        SharedPrefferenceClass().saveuserUID(user.uid);
        if (getShapShort != null) {
          CustomSnackBarController().showCustumSnackbar(
              'Welcome', 'Successfully registered', ContentType.success);
          Get.off(() => const BottomNavigatioBarScreen());
        } else {}
        return true;
      } else {
        return false;
      }
    } catch (e) {
      CustomSnackBarController().showCustumSnackbar(
          'Oops', 'Invalid email or password !', ContentType.failure);
    }
  }

//google sign up
  Future<void> googleSignUp() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return;
      } else {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gAuth.accessToken, idToken: gAuth.idToken);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          QuerySnapshot? snapshot =
              await FirebaseDatabaseClass(uid: user.uid).gettingUserData();
          if (snapshot == null) {
            await FirebaseDatabaseClass(uid: user.uid)
                .saveUserData(user.email!);
            SharedPrefferenceClass().saveuserUID(user.uid);
            Get.off(() => const BottomNavigatioBarScreen());
          } else {
            SharedPrefferenceClass().saveuserUID(user.uid);
            Get.off(() => const BottomNavigatioBarScreen());
          }
        } else {}
      }
    } catch (e) {
      CustomSnackBarController()
          .showCustumSnackbar('Oops', 'message', ContentType.failure);
    }
  }
}
