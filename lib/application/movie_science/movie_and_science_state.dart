part of 'movie_and_science_bloc.dart';

@freezed
class MovieAndScienceState with _$MovieAndScienceState {
  factory MovieAndScienceState(
      {required List<MoviesAndScienceArticle> movieScienceList,
      required bool isLoading,
      required bool isError}) = _MovieAndScienceState;
  factory MovieAndScienceState.initial() => MovieAndScienceState(
      movieScienceList: [], isLoading: false, isError: false);
}
