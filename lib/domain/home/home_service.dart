import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/home/model/search_home.dart';
import 'package:dartz/dartz.dart';

abstract class HomeService {
  Future<Either<MainFailures, SearchHome>> getHomeService(
      {required String query});
}
