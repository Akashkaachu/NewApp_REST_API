import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/api_endpoints.dart';
import 'package:mini/domain/category/category_service.dart';
import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/home/model/search_home.dart';

@LazySingleton(as: CategoryService)
class CategoryServiceImplements implements CategoryService {
  @override
  Future<Either<MainFailures, SearchHome>> getCategoryService(
      {required String category}) async {
    try {
      Response response = await Dio(BaseOptions())
          .get(ApiEndPoints().categoryFun(category: category));
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchHome.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
