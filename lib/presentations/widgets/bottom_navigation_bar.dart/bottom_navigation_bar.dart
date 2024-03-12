import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/presentations/app_bar_widget/app_bar_widget.dart';
import 'package:mini/presentations/widgets/discove_page/discover_page.dart';
import 'package:mini/presentations/widgets/favorite_page/favorit_page.dart';
import 'package:mini/presentations/widgets/news_front_page/news_front_page.dart';
import 'package:mini/screens/splash/splash_screen.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
List<Widget> pages = [NewsPage(), const DiscoverPage(), const FavoritePage()];
List<Widget> nameOfPages = [
  ConcatenatedTextWithColors(),
  const Text(
    "DISCOVER",
    style: TextStyle(color: kBlack, fontWeight: FontWeight.w800, fontSize: 20),
  ),
  const Text(
    'FAVORITES',
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
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: const Icon(Icons.live_tv_outlined, color: kRed),
                      text: "Live Tv",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading:
                          const Icon(Icons.now_widgets_outlined, color: kBlack),
                      text: "E-Paper",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: const Icon(Icons.settings, color: kBlack),
                      text: "Settings",
                      onTap: () {},
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
                      leading:
                          const Icon(Icons.person_pin_circle, color: kBlack),
                      text: "News",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        "assets/images/6626790-200.png",
                        width: 25,
                        color: kBlack,
                      ),
                      text: "Kerala",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                          'assets/images/india-map-country.png',
                          width: 25),
                      text: "India",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        "assets/images/worldIcon.png",
                        width: 25,
                      ),
                      text: "World",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        "assets/images/movieIcon.jpg",
                        width: 29,
                      ),
                      text: "Movie",
                      onTap: () {},
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
                      leading: const Icon(
                        Icons.school_outlined,
                        color: kBlack,
                      ),
                      text: "Education",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset('assets/images/bussinessIcon.png',
                          width: 25),
                      text: "Bussiness",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                        'assets/images/healthIcon.png',
                        width: 25,
                      ),
                      text: "Health",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset('assets/images/technologyIcon.png',
                          width: 25),
                      text: "Technology",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading:
                          Image.asset('assets/images/musicIcon.png', width: 25),
                      text: "Music",
                      onTap: () {},
                    ),
                    ListTileWidgets(
                      leading: Image.asset(
                          'assets/images/entertainmentIcon.png',
                          width: 25),
                      text: "Entertainment",
                      onTap: () {},
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
                        icon: const Icon(Icons.favorite_border_outlined),
                        title: const Text("Favorite"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
