import 'package:json_annotation/json_annotation.dart';
part 'search_home.g.dart';

@JsonSerializable()
class SearchHome {
  String? status;
  int? totalResults;
  List<HomeSearchArticle> articles;

  SearchHome({this.status, this.totalResults, this.articles = const []});

  factory SearchHome.fromJson(Map<String, dynamic> json) {
    return _$SearchHomeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchHomeToJson(this);
}

@JsonSerializable()
class HomeSearchArticle {
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  HomeSearchArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory HomeSearchArticle.fromJson(Map<String, dynamic> json) {
    return _$HomeSearchArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeSearchArticleToJson(this);
}
