import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/domain/home/model/search_home.dart';
import 'package:mini/presentations/widgets/news_front_page/news_front_page.dart';
import 'package:mini/screens/splash/splash_screen.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({
    super.key,
    required this.modelList,
  });
  final HomeSearchArticle modelList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: lightBlueAccent,
            elevation: 0,
            centerTitle: true,
            title: ConcatenatedTextWithColors(),
          )),
      body: SizedBox(
          child: Column(
        children: [
          const Dividerwidget(thickness: 3),
          Container(
            width: Get.width,
            height: 200,
            color: kRed,
            child: Image.network(
              modelList.urlToImage.toString(),
              fit: BoxFit.cover,
            ),
          ),
          const Dividerwidget(thickness: 3),
          sizedHeigtBox10,
          Row(
            children: [
              sizedWidthBox10,
              Text(dateAndTime(modelList.publishedAt.toString())),
              const Spacer(),
              const LikeButtonWidget(),
              IconButton(
                  onPressed: () {
                    Share.share(modelList.url.toString());
                  },
                  icon: const Icon(Icons.share)),
            ],
          ),
          const Dividerwidget(thickness: 1),
          Text(
            modelList.title.toString(),
            maxLines: 16,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          sizedHeigtBox10,
          Text(
            modelList.content.toString(),
            maxLines: 10,
            style: const TextStyle(color: kGrey, fontWeight: FontWeight.bold),
          ),
          sizedHeigtBox40,
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(lightBlueAccent),
              ),
              onPressed: () async {
                final Uri url = Uri.parse(modelList.url.toString());
                if (!await launchUrl(url)) {
                  throw Exception('could not lauch');
                }
              },
              child: const Text("Do you want to read More Details"))
        ],
      )),
    );
  }
}
