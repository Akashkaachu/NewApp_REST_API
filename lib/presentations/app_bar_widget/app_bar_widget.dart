import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/presentations/widgets/search_bar/search_bar.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key, required this.tittle});
  final Widget tittle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightBlueAccent,
      title: Row(
        children: [
          Image.asset("assets/images/broadcasting.png", width: 25),
          sizedWidthBox10,
          tittle,
          const Spacer(),
          IconButton(
              onPressed: () {
                Get.to(() => const SearchPage());
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
    );
  }
}
