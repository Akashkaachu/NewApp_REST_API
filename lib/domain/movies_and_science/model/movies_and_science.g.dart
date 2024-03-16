// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_and_science.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesAndScience _$MoviesAndScienceFromJson(Map<String, dynamic> json) =>
    MoviesAndScience(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) =>
                  MoviesAndScienceArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MoviesAndScienceToJson(MoviesAndScience instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

MoviesAndScienceArticle _$MoviesAndScienceArticleFromJson(
        Map<String, dynamic> json) =>
    MoviesAndScienceArticle(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MoviesAndScienceArticleToJson(
        MoviesAndScienceArticle instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
