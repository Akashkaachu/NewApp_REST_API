import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/home/home_service.dart';
import 'package:mini/domain/home/model/search_home.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeServices;
  HomeBloc(this._homeServices) : super(HomeState.initial()) {
    on<TopNewsToday>((event, emit) async {
      log('search for ${event.query}');
      emit(const HomeState(newsList: [], isLoading: true, isError: false));
      final result = await _homeServices.getHomeService(query: event.query);
      result.fold((l) {
        emit(const HomeState(newsList: [], isLoading: false, isError: true));
      }, (r) {
        emit(HomeState(newsList: r.articles, isLoading: false, isError: false));
      });
    });
  }
}
