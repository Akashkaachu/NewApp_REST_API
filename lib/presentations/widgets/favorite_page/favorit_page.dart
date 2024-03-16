import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        sizedHeigtBox15,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://qph.cf2.quoracdn.net/main-qimg-a0e898db4b9ef791a0ef62fcfd194859-lq'),
            ),
          ],
        ),
        sizedHeigtBox10,
        const Text(
          'PARA SPECIAL FORCE',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: Get.width,
            height: 351,
            decoration: BoxDecoration(
                color: lightBlueAccent,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: const Column(children: [
              ListTileWidget(
                  title: 'User feedback',
                  leading: Icons.message,
                  trailing: Icons.navigate_next),
              Divider(color: kBlack),
              ListTileWidget(
                  title: 'Edit Profile',
                  leading: Icons.edit,
                  trailing: Icons.navigate_next),
              Divider(color: kBlack),
              ListTileWidget(
                  title: 'Privacy Policy',
                  leading: Icons.privacy_tip_outlined,
                  trailing: Icons.navigate_next),
              Divider(color: kBlack),
              ListTileWidget(
                  title: 'Share Application',
                  leading: Icons.share,
                  trailing: Icons.navigate_next),
              Divider(color: kBlack),
              ListTileWidget(
                  title: 'Logout',
                  leading: Icons.logout,
                  trailing: Icons.navigate_next),
            ]),
          ),
        )
      ]),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    required this.leading,
    required this.trailing,
  });
  final String title;
  final IconData leading;
  final IconData trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(leading),
      trailing: Icon(trailing),
    );
  }
}
