// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'india_news_search_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndiaNewsSearchHome _$IndiaNewsSearchHomeFromJson(Map<String, dynamic> json) =>
    IndiaNewsSearchHome(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) =>
                  CategoryAndCountryList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$IndiaNewsSearchHomeToJson(
        IndiaNewsSearchHome instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

CategoryAndCountryList _$CategoryAndCountryListFromJson(
        Map<String, dynamic> json) =>
    CategoryAndCountryList(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$CategoryAndCountryListToJson(
        CategoryAndCountryList instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
