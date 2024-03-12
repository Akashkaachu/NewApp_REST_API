part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required List<HomeSearchArticle> newsList,
      required bool isLoading,
      required bool isError}) = _HomeState;
  factory HomeState.initial() =>
      const HomeState(newsList: [], isLoading: false, isError: false);
}
