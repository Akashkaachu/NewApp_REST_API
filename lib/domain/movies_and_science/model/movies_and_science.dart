import 'package:json_annotation/json_annotation.dart';
part 'movies_and_science.g.dart';

@JsonSerializable()
class MoviesAndScience {
  String? status;
  int? totalResults;
  List<MoviesAndScienceArticle> articles;

  MoviesAndScience({this.status, this.totalResults, this.articles = const []});

  factory MoviesAndScience.fromJson(Map<String, dynamic> json) {
    return _$MoviesAndScienceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoviesAndScienceToJson(this);
}

@JsonSerializable()
class MoviesAndScienceArticle {
  String? author;
  String? title;
  String? description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  String? content;

  MoviesAndScienceArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory MoviesAndScienceArticle.fromJson(Map<String, dynamic> json) {
    return _$MoviesAndScienceArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoviesAndScienceArticleToJson(this);
}
