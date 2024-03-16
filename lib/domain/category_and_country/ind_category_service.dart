import 'package:dartz/dartz.dart';
import 'package:mini/domain/category_and_country/model/india_news_search_home.dart';
import 'package:mini/domain/core/failures/main_failures.dart';

abstract class IndiaCategoryService {
  Future<Either<MainFailures, IndiaNewsSearchHome>> getIndiaCategoryService(
      {required String country, required String category});
}
