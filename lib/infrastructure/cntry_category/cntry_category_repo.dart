import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/api_endpoints.dart';
import 'package:mini/domain/category_and_country/ind_category_service.dart';
import 'package:mini/domain/category_and_country/model/india_news_search_home.dart';
import 'package:mini/domain/core/failures/main_failures.dart';

@LazySingleton(as: IndiaCategoryService)
class IndiaCategoryServiceImplements implements IndiaCategoryService {
  @override
  Future<Either<MainFailures, IndiaNewsSearchHome>> getIndiaCategoryService(
      {required String country, required String category}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
          ApiEndPoints().indiaNewsFun(country: country, category: category));
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = IndiaNewsSearchHome.fromJson(response.data);
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
