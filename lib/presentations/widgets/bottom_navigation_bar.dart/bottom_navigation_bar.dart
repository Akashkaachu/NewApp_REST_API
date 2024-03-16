import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/presentations/app_bar_widget/app_bar_widget.dart';
import 'package:mini/presentations/widgets/discove_page/discover_page.dart';
import 'package:mini/presentations/widgets/drawer_conter_pgs.dart';
import 'package:mini/presentations/widgets/favorite_page/favorit_page.dart';
import 'package:mini/presentations/widgets/news_front_page/news_front_page.dart';
import 'package:mini/screens/splash/splash_screen.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
List<Widget> pages = [NewsPage(), const DiscoverPage(), const SettingsPage()];
List<Widget> nameOfPages = [
  ConcatenatedTextWithColors(),
  const Text(
    "DISCOVER",
    style: TextStyle(color: kBlack, fontWeight: FontWeight.w800, fontSize: 20),
  ),
  const Text(
    'SETTINGS',
    style: TextStyle(color: kBlack, fontWeight: FontWeight.w800, fontSize: 20),
  )
];

class BottomNavigatioBarScreen extends StatelessWidget {
  const BottomNavigatioBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, newIndex, child) {
          return Container(
            color: lightBlueAccent,
            child: SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: AppBarWidgets(tittle: nameOfPages[newIndex])),
                drawer: Drawer(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Row(children: [
                        Image.asset(
                          "assets/images/broadcasting.png",
                          width: 35,
                        ),
                        sizedWidthBox10,
                        ConcatenatedTextWithColors()
                      ]),
                    ),
                    ListTileWidgets(
                      leading: const Icon(Icons.home_outlined, color: kBlack),
                      text: "Home",
                      onTap: () {
                        Get.back();
                        indexChangeNotifier.value = 0;
                      },
                    ),
                    ListTileWidgets(
                      leading: const Icon(Icons.live_tv_outlined, color: kRed),
                      text: "Live Tv",
                      onTap: () async {
                        final Uri url = Uri.parse(
                            'https://www.youtube.com/live/1wECsnGZcfc?si=-Ld8_jbtxGog1qnI');
                        if (!await launchUrl(url)) {
                          throw Exception('could not lauch');
                        }
                      },
                    ),
                    ListTileWidgets(
                      leading:
                          const Icon(Icons.now_widgets_outlined, color: kBlack),
                      text: "E-Paper",
                      onTap: () async {
                        final Uri url =
                            Uri.parse('https://epaper.mathrubhumi.com/');
                        if (!await launchUrl(url)) {
                          throw Exception('could not lauch');
                        }
                      },
                    ),
                    ListTileWidgets(
                      leading: const Icon(Icons.settings, color: kBlack),
                      text: "Settings",
                      onTap: () {
                        Get.back();
                        indexChangeNotifier.value = 2;
                      },
                    ),
                    const Divider(
                      thickness: 1,
                      color: kBlack,
                    ),
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTileWidgets(
                      leading: Image.asset('assets/images/bussinessIcon.png',
                          width: 25),
                      text: "Business",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                              categoryItems: 'business',
                            ));
                      },
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                          'assets/images/entertainmentIcon.png',
                          width: 25),
                      text: "Entertainment",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                            categoryItems: 'entertainment'));
                      },
                    ),
                    ListTileWidgets(
                      leading:
                          Image.asset('assets/images/hammer.png', width: 25),
                      text: "General",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                            categoryItems: 'general'));
                      },
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        'assets/images/healthIcon.png',
                        width: 25,
                      ),
                      text: "Health",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                            categoryItems: 'health'));
                      },
                    ),
                    ListTileWidgets(
                      leading: Image.asset('assets/images/atom.png', width: 25),
                      text: "Science",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                            categoryItems: 'science'));
                      },
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        "assets/images/running.png",
                        width: 25,
                      ),
                      text: "Sports",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset('assets/images/technologyIcon.png',
                          width: 25),
                      text: "Technology",
                      onTap: () {
                        Get.back();
                        Get.to(() => const DrawerEachContentPages(
                            categoryItems: 'technology'));
                      },
                    ),
                  ],
                )),
                body: pages[newIndex],
                bottomNavigationBar: FlashyTabBar(
                  animationDuration: const Duration(milliseconds: 1300),
                  selectedIndex: indexChangeNotifier.value,
                  iconSize: 30.0,
                  showElevation: true,
                  onItemSelected: (index) {
                    indexChangeNotifier.value = index;
                  },
                  items: [
                    FlashyTabBarItem(
                        icon: const Icon(Icons.newspaper_outlined),
                        title: const Text("News")),
                    FlashyTabBarItem(
                        icon: const Icon(Icons.language_outlined),
                        title: const Text("Discover")),
                    FlashyTabBarItem(
                        icon: const Icon(Icons.settings_outlined),
                        title: const Text("Settings"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
