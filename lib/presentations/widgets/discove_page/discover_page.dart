import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mini/application/movie_science/movie_and_science_bloc.dart';
import 'package:mini/core/color/color.dart';
import 'package:mini/core/const/const.dart';
import 'package:mini/utility/refactory_widgets/refactory_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<MovieAndScienceBloc>(context)
          .add(const MovieAndScience(movie: 'movie', science: 'science'));
    });

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          BlocBuilder<MovieAndScienceBloc, MovieAndScienceState>(
            builder: (context, state) {
              if (state.movieScienceList.isNotEmpty) {
                return Column(
                    children: List.generate(
                        state.movieScienceList.length,
                        (index) => Column(
                              children: [
                                DiscoverWidgets(
                                  imageUrl:
                                      state.movieScienceList[index].urlToImage,
                                  title:
                                      state.movieScienceList[index].title ?? '',
                                  onPressed: () {
                                    Share.share(
                                        state.movieScienceList[index].url ??
                                            '');
                                  },
                                  modelList: state.movieScienceList[index],
                                ),
                                sizedHeigtBox10
                              ],
                            )));
              } else {
                return Column(
                  children: List.generate(
                      10,
                      (index) => Column(
                            children: [
                              Shimmer.fromColors(
                                period: const Duration(milliseconds: 3000),
                                baseColor: Colors.white,
                                highlightColor: Colors.grey.shade500,
                                enabled: true,
                                child: Container(
                                  width: Get.width,
                                  height: 410,
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              sizedHeigtBox10
                            ],
                          )),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
