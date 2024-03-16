// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini/application/home/home_bloc.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});
  ValueNotifier<int> valueNtfr = ValueNotifier(0);
  List<String> topTrendingList = ['Breaking News', 'Politics', 'Entertainment'];

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    BlocProvider.of<HomeBloc>(context)
        .add(TopNewsToday(query: topTrendingList[valueNtfr.value]));

    BlocProvider.of<HomeBloc>(context)
        .add(const IndiaCategoryNews(country: 'in', category: ''));
    // });
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: topTrendingList.length,
                  separatorBuilder: (context, index) => sizedWidthBox10,
                  itemBuilder: (context, index) => ChoiceChipsWidget(
                      choicechipNumber: index,
                      title: topTrendingList[index],
                      valueListenable: valueNtfr),
                ),
              ),
              sizedHeigtBox15,
              const Text(
                'WORLD NEWS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 292,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.newsList.isNotEmpty) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            state.newsList.length,
                            (index) => Row(
                                  children: [
                                    TopNewsTopWidgets(
                                      modelList: state.newsList[index],
                                      contry: 'World News',
                                      content: state.newsList[index].title
                                          .toString(),
                                      image: state.newsList[index].urlToImage
                                          .toString(),
                                      time: formatTime(state
                                          .newsList[index].publishedAt
                                          .toString()),
                                      onPressed: () async {
                                        await Share.share(
                                            '${state.newsList[index].url}');
                                      },
                                      monthAndDates: monthAndDay(state
                                          .newsList[index].publishedAt
                                          .toString()),
                                    ),
                                    sizedWidthBox10
                                  ],
                                )),
                      );
                    } else {
                      return Center(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => Shimmer.fromColors(
                                  period: const Duration(milliseconds: 3000),
                                  baseColor: kWhite,
                                  highlightColor: Colors.grey.shade500,
                                  enabled: true,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 225,
                                        height: 292,
                                        decoration: BoxDecoration(
                                            color: kBlack,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      sizedWidthBox10
                                    ],
                                  ),
                                )),
                      ));
                    }
                  },
                ),
              ),
              sizedHeigtBox15,
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.categoryCountryList.isNotEmpty) {
                    return Column(
                      children: List.generate(
                        state.categoryCountryList.length,
                        (index) => Column(
                          children: [
                            MixedNewsUpdatesWidgets(
                              countryName: 'India',
                              time: formatTime(state
                                  .categoryCountryList[index].publishedAt
                                  .toString()),
                              mmDD: monthAndDay(state
                                  .categoryCountryList[index].publishedAt
                                  .toString()),
                              content: state.categoryCountryList[index].title
                                  .toString(),
                              image: state.categoryCountryList[index].urlToImage
                                  .toString(),
                              onPressed: () {
                                Share.share(state.categoryCountryList[index].url
                                    .toString());
                              },
                              modelList: state.categoryCountryList[index],
                            ),
                            sizedHeigtBox10
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 236,
                      child: ListView(
                        children: List.generate(
                            10,
                            (index) => Shimmer.fromColors(
                                  period: const Duration(milliseconds: 3000),
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: Get.width,
                                        height: 236,
                                        decoration:
                                            const BoxDecoration(color: kBlack),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    );
                  }
                },
              ),
              sizedHeigtBox15,
            ]),
          ),
        ),
      )),
    );
  }
}

String monthAndDay(String timezone) {
  DateTime dateTime = DateTime.parse(timezone);
  String formattedDate = DateFormat("dd MMM, yyyy").format(dateTime);
  return formattedDate;
}

String formatTime(String timezone) {
  DateTime pastDateTime = DateTime.parse(timezone);
  String formattedTime = DateFormat.Hm().format(pastDateTime);
  return formattedTime;
}
