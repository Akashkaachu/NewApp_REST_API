import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/movies_and_science/model/movies_and_science.dart';
import 'package:mini/domain/movies_and_science/movie_sci_service.dart';

part 'movie_and_science_event.dart';
part 'movie_and_science_state.dart';
part 'movie_and_science_bloc.freezed.dart';

@injectable
class MovieAndScienceBloc
    extends Bloc<MovieAndScienceEvent, MovieAndScienceState> {
  final MovieScienceService _movieScienceService;
  MovieAndScienceBloc(this._movieScienceService)
      : super(MovieAndScienceState.initial()) {
    on<MovieAndScienceEvent>((event, emit) async {
      log("print ${event.movie}${event.science}");
      emit(MovieAndScienceState(
          movieScienceList: [], isLoading: false, isError: false));
      final result = await _movieScienceService.getMovieScienceService(
          movie: event.movie, science: event.science);
      result.fold(
          (l) => emit(MovieAndScienceState(
              movieScienceList: [], isLoading: false, isError: true)),
          (r) => emit(MovieAndScienceState(
              movieScienceList: r.articles, isLoading: false, isError: false)));
    });
  }
}
