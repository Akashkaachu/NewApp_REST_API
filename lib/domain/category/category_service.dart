import 'package:dartz/dartz.dart';
import 'package:mini/domain/core/failures/main_failures.dart';
import 'package:mini/domain/home/model/search_home.dart';

abstract class CategoryService {
  Future<Either<MainFailures, SearchHome>> getCategoryService(
      {required String category});
}
