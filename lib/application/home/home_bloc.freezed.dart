// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) topNewsToday,
    required TResult Function(String country, String category)
        indiaCategoryNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? topNewsToday,
    TResult? Function(String country, String category)? indiaCategoryNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? topNewsToday,
    TResult Function(String country, String category)? indiaCategoryNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TopNewsToday value) topNewsToday,
    required TResult Function(IndiaCategoryNews value) indiaCategoryNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TopNewsToday value)? topNewsToday,
    TResult? Function(IndiaCategoryNews value)? indiaCategoryNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TopNewsToday value)? topNewsToday,
    TResult Function(IndiaCategoryNews value)? indiaCategoryNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TopNewsTodayImplCopyWith<$Res> {
  factory _$$TopNewsTodayImplCopyWith(
          _$TopNewsTodayImpl value, $Res Function(_$TopNewsTodayImpl) then) =
      __$$TopNewsTodayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$TopNewsTodayImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$TopNewsTodayImpl>
    implements _$$TopNewsTodayImplCopyWith<$Res> {
  __$$TopNewsTodayImplCopyWithImpl(
      _$TopNewsTodayImpl _value, $Res Function(_$TopNewsTodayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$TopNewsTodayImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TopNewsTodayImpl implements TopNewsToday {
  const _$TopNewsTodayImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'HomeEvent.topNewsToday(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopNewsTodayImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopNewsTodayImplCopyWith<_$TopNewsTodayImpl> get copyWith =>
      __$$TopNewsTodayImplCopyWithImpl<_$TopNewsTodayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) topNewsToday,
    required TResult Function(String country, String category)
        indiaCategoryNews,
  }) {
    return topNewsToday(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? topNewsToday,
    TResult? Function(String country, String category)? indiaCategoryNews,
  }) {
    return topNewsToday?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? topNewsToday,
    TResult Function(String country, String category)? indiaCategoryNews,
    required TResult orElse(),
  }) {
    if (topNewsToday != null) {
      return topNewsToday(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TopNewsToday value) topNewsToday,
    required TResult Function(IndiaCategoryNews value) indiaCategoryNews,
  }) {
    return topNewsToday(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TopNewsToday value)? topNewsToday,
    TResult? Function(IndiaCategoryNews value)? indiaCategoryNews,
  }) {
    return topNewsToday?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TopNewsToday value)? topNewsToday,
    TResult Function(IndiaCategoryNews value)? indiaCategoryNews,
    required TResult orElse(),
  }) {
    if (topNewsToday != null) {
      return topNewsToday(this);
    }
    return orElse();
  }
}

abstract class TopNewsToday implements HomeEvent {
  const factory TopNewsToday({required final String query}) =
      _$TopNewsTodayImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$TopNewsTodayImplCopyWith<_$TopNewsTodayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IndiaCategoryNewsImplCopyWith<$Res> {
  factory _$$IndiaCategoryNewsImplCopyWith(_$IndiaCategoryNewsImpl value,
          $Res Function(_$IndiaCategoryNewsImpl) then) =
      __$$IndiaCategoryNewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String country, String category});
}

/// @nodoc
class __$$IndiaCategoryNewsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$IndiaCategoryNewsImpl>
    implements _$$IndiaCategoryNewsImplCopyWith<$Res> {
  __$$IndiaCategoryNewsImplCopyWithImpl(_$IndiaCategoryNewsImpl _value,
      $Res Function(_$IndiaCategoryNewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? category = null,
  }) {
    return _then(_$IndiaCategoryNewsImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IndiaCategoryNewsImpl implements IndiaCategoryNews {
  const _$IndiaCategoryNewsImpl(
      {required this.country, required this.category});

  @override
  final String country;
  @override
  final String category;

  @override
  String toString() {
    return 'HomeEvent.indiaCategoryNews(country: $country, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndiaCategoryNewsImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndiaCategoryNewsImplCopyWith<_$IndiaCategoryNewsImpl> get copyWith =>
      __$$IndiaCategoryNewsImplCopyWithImpl<_$IndiaCategoryNewsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) topNewsToday,
    required TResult Function(String country, String category)
        indiaCategoryNews,
  }) {
    return indiaCategoryNews(country, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? topNewsToday,
    TResult? Function(String country, String category)? indiaCategoryNews,
  }) {
    return indiaCategoryNews?.call(country, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? topNewsToday,
    TResult Function(String country, String category)? indiaCategoryNews,
    required TResult orElse(),
  }) {
    if (indiaCategoryNews != null) {
      return indiaCategoryNews(country, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TopNewsToday value) topNewsToday,
    required TResult Function(IndiaCategoryNews value) indiaCategoryNews,
  }) {
    return indiaCategoryNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TopNewsToday value)? topNewsToday,
    TResult? Function(IndiaCategoryNews value)? indiaCategoryNews,
  }) {
    return indiaCategoryNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TopNewsToday value)? topNewsToday,
    TResult Function(IndiaCategoryNews value)? indiaCategoryNews,
    required TResult orElse(),
  }) {
    if (indiaCategoryNews != null) {
      return indiaCategoryNews(this);
    }
    return orElse();
  }
}

abstract class IndiaCategoryNews implements HomeEvent {
  const factory IndiaCategoryNews(
      {required final String country,
      required final String category}) = _$IndiaCategoryNewsImpl;

  String get country;
  String get category;
  @JsonKey(ignore: true)
  _$$IndiaCategoryNewsImplCopyWith<_$IndiaCategoryNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  List<HomeSearchArticle> get newsList => throw _privateConstructorUsedError;
  List<CategoryAndCountryList> get categoryCountryList =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HomeSearchArticle> newsList,
      List<CategoryAndCountryList> categoryCountryList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsList = null,
    Object? categoryCountryList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      newsList: null == newsList
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<HomeSearchArticle>,
      categoryCountryList: null == categoryCountryList
          ? _value.categoryCountryList
          : categoryCountryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryAndCountryList>,
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
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HomeSearchArticle> newsList,
      List<CategoryAndCountryList> categoryCountryList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsList = null,
    Object? categoryCountryList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$HomeStateImpl(
      newsList: null == newsList
          ? _value._newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<HomeSearchArticle>,
      categoryCountryList: null == categoryCountryList
          ? _value._categoryCountryList
          : categoryCountryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryAndCountryList>,
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

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required final List<HomeSearchArticle> newsList,
      required final List<CategoryAndCountryList> categoryCountryList,
      required this.isLoading,
      required this.isError})
      : _newsList = newsList,
        _categoryCountryList = categoryCountryList;

  final List<HomeSearchArticle> _newsList;
  @override
  List<HomeSearchArticle> get newsList {
    if (_newsList is EqualUnmodifiableListView) return _newsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsList);
  }

  final List<CategoryAndCountryList> _categoryCountryList;
  @override
  List<CategoryAndCountryList> get categoryCountryList {
    if (_categoryCountryList is EqualUnmodifiableListView)
      return _categoryCountryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryCountryList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(newsList: $newsList, categoryCountryList: $categoryCountryList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._newsList, _newsList) &&
            const DeepCollectionEquality()
                .equals(other._categoryCountryList, _categoryCountryList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newsList),
      const DeepCollectionEquality().hash(_categoryCountryList),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final List<HomeSearchArticle> newsList,
      required final List<CategoryAndCountryList> categoryCountryList,
      required final bool isLoading,
      required final bool isError}) = _$HomeStateImpl;

  @override
  List<HomeSearchArticle> get newsList;
  @override
  List<CategoryAndCountryList> get categoryCountryList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
