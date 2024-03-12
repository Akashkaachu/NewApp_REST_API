import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/presentations/widgets/bottom_navigation_bar.dart/bottom_navigation_bar.dart';
import 'package:mini/screens/sign_up/sign_up.dart';
import 'package:mini/service/helper/sharedpreference/sharedpreference.dart';

class SplashScrn extends StatefulWidget {
  const SplashScrn({super.key});

  @override
  State<SplashScrn> createState() => _SplashScrnState();
}

final SharedPrefferenceClass sharedController =
    Get.put(SharedPrefferenceClass());
bool issignedIn = false;
String email = '';

class _SplashScrnState extends State<SplashScrn> {
  @override
  void initState() {
    sharedController.getUserUID();
    splashtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
                'assets/animations/Animation-1709746868806.json'),
            ConcatenatedTextWithColors()
          ],
        ),
      ),
    );
  }

  void splashtime() async {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        print(sharedController.uid.value);
        if (sharedController.uid.value.isEmpty) {
          Get.off(() => SignUpPage());
        } else {
          Get.off(() => const BottomNavigatioBarScreen());
        }
      },
    );
  }
}

class ConcatenatedTextWithColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "News",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kRed)),
          TextSpan(
              text: "Watch",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kBlack)),
        ],
      ),
    );
  }
}
