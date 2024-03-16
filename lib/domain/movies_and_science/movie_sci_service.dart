import 'package:dartz/dartz.dart';
import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/movies_and_science/model/movies_and_science.dart';

abstract class MovieScienceService {
  Future<Either<MainFailures, MoviesAndScience>> getMovieScienceService(
      {required String movie, required String science});
}
