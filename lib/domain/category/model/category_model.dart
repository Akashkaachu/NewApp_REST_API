import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? status;
  int? totalResults;
  List<CategoryList> articles;

  CategoryModel({this.status, this.totalResults, this.articles = const []});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryList {
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;

  CategoryList({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return _$CategoryListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
