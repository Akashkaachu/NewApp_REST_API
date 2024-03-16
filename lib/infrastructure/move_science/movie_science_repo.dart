import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mini/domain/api_endpoints.dart';
import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/movies_and_science/model/movies_and_science.dart';
import 'package:mini/domain/movies_and_science/movie_sci_service.dart';

@LazySingleton(as: MovieScienceService)
class MovieAndScienceImplements implements MovieScienceService {
  @override
  Future<Either<MainFailures, MoviesAndScience>> getMovieScienceService(
      {required String movie, required String science}) async {
    try {
      Response response = await Dio(BaseOptions()).get(
          ApiEndPoints().movieAndScienceFun(movies: movie, science: science));
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MoviesAndScience.fromJson(response.data);
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
