import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mini/application/home/home_bloc.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/domain/category_and_country/model/india_news_search_home.dart';
import 'package:mini/domain/home/model/search_home.dart';
import 'package:mini/presentations/widgets/common_page.dart';
import 'package:mini/presentations/widgets/search_bar/search_bar_widget/search_bar_widget.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context)
          .add(const TopNewsToday(query: 'query'));
    });
    return Container(
      color: lightBlueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SearchBarWidgets(
                onChanged: (value) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(TopNewsToday(query: value));
                },
              )),
          backgroundColor: Colors.white,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.newsList.isEmpty) {
                return ListView(
                    children: List.generate(
                        10,
                        (index) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: kWhite,
                                    highlightColor: Colors.grey,
                                    child: Container(
                                      width: Get.width,
                                      height: 86,
                                      decoration: BoxDecoration(
                                          color: lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                                sizedHeigtBox10
                              ],
                            )));
              }
              return ListView(
                  children: List.generate(
                      state.newsList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SearchBarPageContentWidget(
                                    numeric: index + 1,
                                    imageUrl: state.newsList[index].urlToImage
                                        .toString(),
                                    text:
                                        state.newsList[index].title.toString(),
                                    modelList: state.newsList[index]),
                              ],
                            ),
                          )));
            },
          ),
        ),
      ),
    );
  }
}

class SearchBarPageContentWidget extends StatelessWidget {
  const SearchBarPageContentWidget({
    super.key,
    required this.numeric,
    required this.imageUrl,
    required this.text,
    required this.modelList,
  });
  final int numeric;
  final String imageUrl;
  final String text;
  final HomeSearchArticle modelList;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CommonPage(modelList: modelList)),
      child: Container(
        width: Get.width,
        height: 86,
        decoration: BoxDecoration(
            color: lightBlueAccent, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: kBlack, borderRadius: BorderRadius.circular(10)),
              child: Text(
                textAlign: TextAlign.center,
                numeric.toString(),
                style: const TextStyle(color: kWhite),
              )),
          sizedWidthBox10,
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(30)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          sizedWidthBox10,
          sizedHeigtBox10,
          Column(
            children: [
              Container(
                width: Get.width / 2 + 62,
                child: Text(
                  text,
                  style: const TextStyle(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
