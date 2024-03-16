// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:mini/application/home/home_bloc.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/domain/category_and_country/model/india_news_search_home.dart';
import 'package:mini/domain/home/model/search_home.dart';
import 'package:mini/domain/movies_and_science/model/movies_and_science.dart';
import 'package:mini/presentations/widgets/common_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.textEditingController,
      this.validator,
      required this.icon,
      required this.hintText,
      this.onChanged,
      required this.suffixIcon,
      this.suffixIconColor,
      this.onTapSuffixIcon,
      this.obscureText = false});

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final IconData icon;
  final IconData? suffixIcon;
  final String hintText;
  final void Function(String)? onChanged;
  Color? suffixIconColor;
  final void Function()? onTapSuffixIcon;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIconColor: suffixIconColor,
        suffixIcon: InkWell(onTap: onTapSuffixIcon, child: Icon(suffixIcon)),
        prefixIcon: Icon(icon),
        hintText: hintText,
        fillColor: kWhite,
        filled: true,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

//============================================================================
class ListTileWidgets extends StatelessWidget {
  ListTileWidgets({
    super.key,
    required this.text,
    this.leading,
    required this.onTap,
  });
  final String text;
  final Widget? leading;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: kGrey),
        ),
        leading: leading);
  }
}

//===============================================================================
class TopNewsTopWidgets extends StatelessWidget {
  TopNewsTopWidgets(
      {super.key,
      required this.content,
      required this.image,
      required this.onPressed,
      required this.contry,
      required this.monthAndDates,
      required this.time,
      required this.modelList});
  final String content;
  final String image;
  final String contry;
  final String monthAndDates;
  final String time;
  void Function()? onPressed;
  final HomeSearchArticle modelList;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CommonPage(modelList: modelList));
      },
      child: Container(
        width: 225,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 225,
              height: 160,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                const Text('NEWS  |'),
                sizedWidthBox10,
                Text(
                  contry,
                )
              ],
            ),
            Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
            sizedHeigtBox5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  monthAndDates,
                  overflow: TextOverflow.ellipsis,
                ),
                sizedWidthBox10,
                Text('$time ⏰')
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: onPressed, icon: const Icon(Icons.share)),
                const LikeButtonWidget(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 20,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
          color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
          size: 20,
        );
      },
      likeCount: 0,
      countBuilder: (count, isLiked, text) {
        var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "Like",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );
  }
}

//===============================
class ChoiceChipsWidget extends StatelessWidget {
  const ChoiceChipsWidget({
    super.key,
    required this.choicechipNumber,
    required this.title,
    required this.valueListenable,
  });
  final int choicechipNumber;
  final String title;
  final ValueNotifier<int> valueListenable;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, choiceValue, child) => ChoiceChip(
        backgroundColor: lightBlueAccent,
        label: Text(
          title,
          style: TextStyle(
              color: choiceValue == choicechipNumber ? kWhite : kGrey,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        selected: choiceValue == choicechipNumber,
        onSelected: (value) {
          valueListenable.value = choicechipNumber;
          BlocProvider.of<HomeBloc>(context).add(TopNewsToday(query: title));
          BlocProvider.of<HomeBloc>(context)
              .add(const IndiaCategoryNews(country: 'in', category: ''));
        },
        selectedColor: kBlack,
      ),
    );
  }
}

//==================================================
class MixedNewsUpdatesWidgets extends StatelessWidget {
  const MixedNewsUpdatesWidgets({
    super.key,
    required this.countryName,
    required this.time,
    required this.mmDD,
    required this.content,
    required this.image,
    required this.onPressed,
    required this.modelList,
  });
  final String countryName;
  final String time;
  final String content;
  final String mmDD;
  final String? image;
  final void Function()? onPressed;
  // final CategoryAndCountryList? modelList;
  final dynamic modelList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CommonPage(modelList: modelList)),
      child: Container(
        width: Get.width,
        height: 236,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Text('NEWS |'),
                sizedWidthBox5,
                Text(countryName, style: const TextStyle(color: kGrey)),
                const Spacer(),
                Text('$time ⏰')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: image != null
                      ? Image.network(
                          image!,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                sizedWidthBox10,
                Expanded(
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      content,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              mmDD,
              style: const TextStyle(color: kGrey),
            ),
            Row(
              children: [
                LikeButton(
                    circleColor:
                        CircleColor(start: lightBlueAccent, end: kRed)),
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.share,
                      color: kGrey,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: kGrey,
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

//======================================================
class Dividerwidget extends StatelessWidget {
  const Dividerwidget({
    super.key,
    required this.thickness,
  });
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      color: kBlack,
      thickness: thickness,
    );
  }
}

//=========================================================
class DiscoverWidgets extends StatelessWidget {
  const DiscoverWidgets({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
    required this.modelList,
  });
  final String? imageUrl;
  final String title;
  final void Function()? onPressed;
  final isEmptyImageUrl =
      'https://ichef.bbci.co.uk/news/1024/branded_news/83B3/production/_115651733_breaking-large-promo-nc.png';
  final MoviesAndScienceArticle modelList;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CommonPage(modelList: modelList)),
      child: Container(
          width: Get.width,
          height: 410,
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedHeigtBox15,
                Container(
                  width: Get.width,
                  height: 320,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(10)),
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                        )
                      : Image.network(isEmptyImageUrl),
                ),
                sizedHeigtBox5,
                Row(
                  children: [
                    const Text('MOVIES & SCIENCE |'),
                    Container(
                      width: Get.width / 4,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    const LikeButton(),
                    IconButton(
                        onPressed: onPressed, icon: const Icon(Icons.share))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
