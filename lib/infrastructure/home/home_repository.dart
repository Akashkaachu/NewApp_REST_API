import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/api_endpoints.dart';
import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/home/home_service.dart';
import 'package:mini/domain/home/model/search_home.dart';

@LazySingleton(as: HomeService)
class HomeServiceImplement implements HomeService {
  @override
  Future<Either<MainFailures, SearchHome>> getHomeService(
      {required String query}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints().searchUrlFunc(query: query));
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
