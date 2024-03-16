part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState(
      {required List<HomeSearchArticle> categoryList,
      required bool isLoading,
      required bool isError}) = _CategoryState;
  factory CategoryState.initial() =>
      const CategoryState(categoryList: [], isLoading: false, isError: false);
}
