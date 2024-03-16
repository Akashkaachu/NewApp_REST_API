part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.topNewsToday({required String query}) = TopNewsToday;
  const factory HomeEvent.indiaCategoryNews(
      {required String country, required String category}) = IndiaCategoryNews;
}
