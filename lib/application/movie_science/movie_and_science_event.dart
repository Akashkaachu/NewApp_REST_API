part of 'movie_and_science_bloc.dart';

@freezed
class MovieAndScienceEvent with _$MovieAndScienceEvent {
  const factory MovieAndScienceEvent.movieAndScience(
      {required String movie, required String science}) = MovieAndScience;
}
