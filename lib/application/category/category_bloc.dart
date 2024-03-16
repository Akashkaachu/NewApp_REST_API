import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/category/category_service.dart';
import 'package:mini/domain/home/model/search_home.dart';
part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService _categoryService;
  CategoryBloc(this._categoryService) : super(CategoryState.initial()) {
    on<CategoryEvent>((event, emit) async {
      log('category for ${event.category}');
      emit(const CategoryState(
          categoryList: [], isLoading: false, isError: false));
      final result =
          await _categoryService.getCategoryService(category: event.category);
      print(result);
      result.fold(
          (l) => emit(const CategoryState(
              categoryList: [], isLoading: false, isError: true)),
          (r) => emit(CategoryState(
              categoryList: r.articles, isLoading: false, isError: false)));
    });
  }
}
