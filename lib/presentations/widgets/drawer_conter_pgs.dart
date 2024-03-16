import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mini/application/category/category_bloc.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/domain/home/model/search_home.dart';
import 'package:mini/presentations/widgets/news_front_page/news_front_page.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class DrawerEachContentPages extends StatelessWidget {
  const DrawerEachContentPages({
    super.key,
    required this.categoryItems,
  });
  final String categoryItems;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<CategoryBloc>(context)
          .add(Categories(category: categoryItems));
    });
    return Container(
      color: kWhite,
      child: Scaffold(
        backgroundColor: lightBlueAccent,
        body: SafeArea(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              print(state.categoryList.length);
              if (state.categoryList.isEmpty) {
                return ListView(
                  children: List.generate(
                      10,
                      (index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Shimmer.fromColors(
                                  baseColor: kWhite,
                                  highlightColor: Colors.grey.shade500,
                                  child: Container(
                                    width: Get.width,
                                    height: 236,
                                    decoration: BoxDecoration(
                                        color: kBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              sizedHeigtBox10
                            ],
                          )),
                );
              }
              return ListView(
                  children: List.generate(
                      state.categoryList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MixedNewsUpdatesWidgets(
                              countryName: 'India',
                              time: formatTime(state
                                  .categoryList[index].publishedAt
                                  .toString()),
                              mmDD: monthAndDay(state
                                  .categoryList[index].publishedAt
                                  .toString()),
                              content: state.categoryList[index].description
                                  .toString(),
                              image: state.categoryList[index].urlToImage,
                              onPressed: () {
                                Share.share(
                                    state.categoryList[index].url.toString());
                              },
                              modelList: state.categoryList[index],
                            ),
                          )));
            },
          ),
        ),
      ),
    );
  }
}
