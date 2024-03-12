// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHome _$SearchHomeFromJson(Map<String, dynamic> json) => SearchHome(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
              ?.map(
                  (e) => HomeSearchArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchHomeToJson(SearchHome instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

HomeSearchArticle _$HomeSearchArticleFromJson(Map<String, dynamic> json) =>
    HomeSearchArticle(
      author: json['author'],
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$HomeSearchArticleToJson(HomeSearchArticle instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
