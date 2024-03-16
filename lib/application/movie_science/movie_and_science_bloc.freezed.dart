// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_and_science_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieAndScienceEvent {
  String get movie => throw _privateConstructorUsedError;
  String get science => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String movie, String science) movieAndScience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String movie, String science)? movieAndScience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String movie, String science)? movieAndScience,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieAndScience value) movieAndScience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieAndScience value)? movieAndScience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieAndScience value)? movieAndScience,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieAndScienceEventCopyWith<MovieAndScienceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieAndScienceEventCopyWith<$Res> {
  factory $MovieAndScienceEventCopyWith(MovieAndScienceEvent value,
          $Res Function(MovieAndScienceEvent) then) =
      _$MovieAndScienceEventCopyWithImpl<$Res, MovieAndScienceEvent>;
  @useResult
  $Res call({String movie, String science});
}

/// @nodoc
class _$MovieAndScienceEventCopyWithImpl<$Res,
        $Val extends MovieAndScienceEvent>
    implements $MovieAndScienceEventCopyWith<$Res> {
  _$MovieAndScienceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? science = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as String,
      science: null == science
          ? _value.science
          : science // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieAndScienceImplCopyWith<$Res>
    implements $MovieAndScienceEventCopyWith<$Res> {
  factory _$$MovieAndScienceImplCopyWith(_$MovieAndScienceImpl value,
          $Res Function(_$MovieAndScienceImpl) then) =
      __$$MovieAndScienceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String movie, String science});
}

/// @nodoc
class __$$MovieAndScienceImplCopyWithImpl<$Res>
    extends _$MovieAndScienceEventCopyWithImpl<$Res, _$MovieAndScienceImpl>
    implements _$$MovieAndScienceImplCopyWith<$Res> {
  __$$MovieAndScienceImplCopyWithImpl(
      _$MovieAndScienceImpl _value, $Res Function(_$MovieAndScienceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? science = null,
  }) {
    return _then(_$MovieAndScienceImpl(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as String,
      science: null == science
          ? _value.science
          : science // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieAndScienceImpl implements MovieAndScience {
  const _$MovieAndScienceImpl({required this.movie, required this.science});

  @override
  final String movie;
  @override
  final String science;

  @override
  String toString() {
    return 'MovieAndScienceEvent.movieAndScience(movie: $movie, science: $science)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieAndScienceImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.science, science) || other.science == science));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie, science);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieAndScienceImplCopyWith<_$MovieAndScienceImpl> get copyWith =>
      __$$MovieAndScienceImplCopyWithImpl<_$MovieAndScienceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String movie, String science) movieAndScience,
  }) {
    return movieAndScience(movie, science);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String movie, String science)? movieAndScience,
  }) {
    return movieAndScience?.call(movie, science);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String movie, String science)? movieAndScience,
    required TResult orElse(),
  }) {
    if (movieAndScience != null) {
      return movieAndScience(movie, science);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieAndScience value) movieAndScience,
  }) {
    return movieAndScience(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieAndScience value)? movieAndScience,
  }) {
    return movieAndScience?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieAndScience value)? movieAndScience,
    required TResult orElse(),
  }) {
    if (movieAndScience != null) {
      return movieAndScience(this);
    }
    return orElse();
  }
}

abstract class MovieAndScience implements MovieAndScienceEvent {
  const factory MovieAndScience(
      {required final String movie,
      required final String science}) = _$MovieAndScienceImpl;

  @override
  String get movie;
  @override
  String get science;
  @override
  @JsonKey(ignore: true)
  _$$MovieAndScienceImplCopyWith<_$MovieAndScienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieAndScienceState {
  List<MoviesAndScienceArticle> get movieScienceList =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieAndScienceStateCopyWith<MovieAndScienceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieAndScienceStateCopyWith<$Res> {
  factory $MovieAndScienceStateCopyWith(MovieAndScienceState value,
          $Res Function(MovieAndScienceState) then) =
      _$MovieAndScienceStateCopyWithImpl<$Res, MovieAndScienceState>;
  @useResult
  $Res call(
      {List<MoviesAndScienceArticle> movieScienceList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$MovieAndScienceStateCopyWithImpl<$Res,
        $Val extends MovieAndScienceState>
    implements $MovieAndScienceStateCopyWith<$Res> {
  _$MovieAndScienceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieScienceList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      movieScienceList: null == movieScienceList
          ? _value.movieScienceList
          : movieScienceList // ignore: cast_nullable_to_non_nullable
              as List<MoviesAndScienceArticle>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieAndScienceStateImplCopyWith<$Res>
    implements $MovieAndScienceStateCopyWith<$Res> {
  factory _$$MovieAndScienceStateImplCopyWith(_$MovieAndScienceStateImpl value,
          $Res Function(_$MovieAndScienceStateImpl) then) =
      __$$MovieAndScienceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MoviesAndScienceArticle> movieScienceList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$MovieAndScienceStateImplCopyWithImpl<$Res>
    extends _$MovieAndScienceStateCopyWithImpl<$Res, _$MovieAndScienceStateImpl>
    implements _$$MovieAndScienceStateImplCopyWith<$Res> {
  __$$MovieAndScienceStateImplCopyWithImpl(_$MovieAndScienceStateImpl _value,
      $Res Function(_$MovieAndScienceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieScienceList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$MovieAndScienceStateImpl(
      movieScienceList: null == movieScienceList
          ? _value._movieScienceList
          : movieScienceList // ignore: cast_nullable_to_non_nullable
              as List<MoviesAndScienceArticle>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MovieAndScienceStateImpl implements _MovieAndScienceState {
  _$MovieAndScienceStateImpl(
      {required final List<MoviesAndScienceArticle> movieScienceList,
      required this.isLoading,
      required this.isError})
      : _movieScienceList = movieScienceList;

  final List<MoviesAndScienceArticle> _movieScienceList;
  @override
  List<MoviesAndScienceArticle> get movieScienceList {
    if (_movieScienceList is EqualUnmodifiableListView)
      return _movieScienceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieScienceList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'MovieAndScienceState(movieScienceList: $movieScienceList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieAndScienceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._movieScienceList, _movieScienceList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movieScienceList),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieAndScienceStateImplCopyWith<_$MovieAndScienceStateImpl>
      get copyWith =>
          __$$MovieAndScienceStateImplCopyWithImpl<_$MovieAndScienceStateImpl>(
              this, _$identity);
}

abstract class _MovieAndScienceState implements MovieAndScienceState {
  factory _MovieAndScienceState(
      {required final List<MoviesAndScienceArticle> movieScienceList,
      required final bool isLoading,
      required final bool isError}) = _$MovieAndScienceStateImpl;

  @override
  List<MoviesAndScienceArticle> get movieScienceList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$MovieAndScienceStateImplCopyWith<_$MovieAndScienceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
