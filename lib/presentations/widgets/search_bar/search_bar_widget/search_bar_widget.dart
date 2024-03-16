import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidgets extends StatelessWidget {
  const SearchBarWidgets({super.key, required this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.keyboard_backspace_outlined)),
        SizedBox(
          width: Get.width * 0.86,
          child: TextField(
            onChanged: onChanged,
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: 'Search for topics,article & features',
            ),
          ),
        ),
      ],
    );
  }
}
