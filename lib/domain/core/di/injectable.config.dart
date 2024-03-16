// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/category/category_bloc.dart' as _i11;
import '../../../application/home/home_bloc.dart' as _i12;
import '../../../application/movie_science/movie_and_science_bloc.dart' as _i13;
import '../../../infrastructure/category/category_repo.dart' as _i4;
import '../../../infrastructure/cntry_category/cntry_category_repo.dart' as _i8;
import '../../../infrastructure/home/home_repository.dart' as _i6;
import '../../../infrastructure/move_science/movie_science_repo.dart' as _i10;
import '../../category/category_service.dart' as _i3;
import '../../category_and_country/ind_category_service.dart' as _i7;
import '../../home/home_service.dart' as _i5;
import '../../movies_and_science/movie_sci_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CategoryService>(() => _i4.CategoryServiceImplements());
  gh.lazySingleton<_i5.HomeService>(() => _i6.HomeServiceImplement());
  gh.lazySingleton<_i7.IndiaCategoryService>(
      () => _i8.IndiaCategoryServiceImplements());
  gh.lazySingleton<_i9.MovieScienceService>(
      () => _i10.MovieAndScienceImplements());
  gh.factory<_i11.CategoryBloc>(
      () => _i11.CategoryBloc(get<_i3.CategoryService>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(
        get<_i5.HomeService>(),
        get<_i7.IndiaCategoryService>(),
      ));
  gh.factory<_i13.MovieAndScienceBloc>(
      () => _i13.MovieAndScienceBloc(get<_i9.MovieScienceService>()));
  return get;
}
