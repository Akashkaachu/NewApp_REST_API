import 'package:json_annotation/json_annotation.dart';
part 'india_news_search_home.g.dart';

@JsonSerializable()
class IndiaNewsSearchHome {
  String? status;
  int? totalResults;
  List<CategoryAndCountryList> articles;

  IndiaNewsSearchHome(
      {this.status, this.totalResults, this.articles = const []});

  factory IndiaNewsSearchHome.fromJson(Map<String, dynamic> json) {
    return _$IndiaNewsSearchHomeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndiaNewsSearchHomeToJson(this);
}

@JsonSerializable()
class CategoryAndCountryList {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  CategoryAndCountryList({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory CategoryAndCountryList.fromJson(Map<String, dynamic> json) {
    return _$CategoryAndCountryListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryAndCountryListToJson(this);
}
