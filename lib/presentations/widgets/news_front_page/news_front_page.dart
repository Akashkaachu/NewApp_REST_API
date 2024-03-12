// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<String> topTrendingList = [
    'Breaking News',
    'Politaical',
    'Entertainment'
  ];

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    BlocProvider.of<HomeBloc>(context).add(const TopNewsToday(query: 'bus'));
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
                'TOP NEWS TODAY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 292,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => Shimmer.fromColors(
                                  period: const Duration(milliseconds: 3000),
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
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
                    } else if (state.isError) {
                      return const Center(
                        child: Text('Error while getting data'),
                      );
                    } else if (state.newsList.isEmpty) {
                      return const Center(
                        child: Text('List is empty'),
                      );
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          state.newsList.length,
                          (index) => Row(
                                children: [
                                  TopNewsTopWidgets(
                                    modelList: state.newsList[index],
                                    contry: 'World News',
                                    content:
                                        state.newsList[index].title.toString(),
                                    image: state.newsList[index].urlToImage
                                        .toString(),
                                    time: formatTime(state
                                        .newsList[index].publishedAt
                                        .toString()),
                                    onPressed: () async {
                                      await Share.share(
                                          '${state.newsList[index].url}');
                                    },
                                    monthAndDates: dateAndTime(state
                                        .newsList[index].publishedAt
                                        .toString()),
                                  ),
                                  sizedWidthBox10
                                ],
                              )),
                    );
                  },
                ),
              ),
              sizedHeigtBox15,
              const MixedNewsUpdatesWidgets(
                  countryName: "INDIA",
                  image: 'assets/images/movieIcon.jpg',
                  mmDD: "Mar 07  | # israel palestine co..",
                  time: '2 min Ago',
                  content:
                      'Cabinet okays 4 percent hike in DA for Central the gove staff.'),
              sizedHeigtBox15,
              const MixedNewsUpdatesWidgets(
                countryName: "Kerala",
                image: 'assets/images/movieIcon.jpg',
                mmDD: "May 12  | # Malappuram",
                time: '20 min Ago',
                content:
                    'Mortal remains of Kerala native killed in Israel leave for India.',
              ),
            ]),
          ),
        ),
      )),
    );
  }
}

String dateAndTime(String timezone) {
  DateTime dateTime = DateTime.parse(timezone);
  String formattedDate = DateFormat("dd MMM, yyyy").format(dateTime);
  return formattedDate;
}

String formatTime(String timezone) {
  DateTime pastDateTime = DateTime.parse(timezone);
  String formattedTime = DateFormat.Hm().format(pastDateTime);
  return formattedTime;
}
