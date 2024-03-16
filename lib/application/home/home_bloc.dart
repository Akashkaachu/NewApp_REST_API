import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/category_and_country/ind_category_service.dart';
import 'package:mini/domain/category_and_country/model/india_news_search_home.dart';
import 'package:mini/domain/home/home_service.dart';
import 'package:mini/domain/home/model/search_home.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeServices;
  final IndiaCategoryService _IndiaCategoryServices;
  HomeBloc(this._homeServices, this._IndiaCategoryServices)
      : super(HomeState.initial()) {
    on<TopNewsToday>((event, emit) async {
      log('search for ${event.query}');
      emit(HomeState(
          newsList: [],
          categoryCountryList: state.categoryCountryList,
          isLoading: true,
          isError: false));
      final result = await _homeServices.getHomeService(query: event.query);
      result.fold((l) {
        emit(HomeState(
            newsList: [],
            categoryCountryList: state.categoryCountryList,
            isLoading: false,
            isError: true));
      }, (r) {
        emit(HomeState(
            newsList: r.articles,
            categoryCountryList: state.categoryCountryList,
            isLoading: false,
            isError: false));
      });
    });
    on<IndiaCategoryNews>((event, emit) async {
      if (state.categoryCountryList.isNotEmpty) {
        emit(state);
        return;
      }
      log("search for${event.country}${event.category}");
      emit(const HomeState(
          newsList: [],
          categoryCountryList: [],
          isLoading: true,
          isError: false));
      final result = await _IndiaCategoryServices.getIndiaCategoryService(
          country: event.country, category: event.category);
      result.fold(
          (l) => emit(HomeState(
              newsList: state.newsList,
              categoryCountryList: [],
              isLoading: false,
              isError: true)),
          (r) => emit(HomeState(
              newsList: state.newsList,
              categoryCountryList: r.articles,
              isLoading: false,
              isError: false)));
    });
  }
}
