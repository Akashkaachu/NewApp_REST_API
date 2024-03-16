import 'package:mini/core/api_key/api_key.dart';
import 'package:mini/core/string/string.dart';

class ApiEndPoints {
  String searchUrlFunc({required String query}) {
    return '$kBaseUrl/everything?q=$query&apiKey=$apiKey';
  }

  String indiaNewsFun({required String country, required String category}) {
    return '$kBaseUrl/top-headlines?country=$country&category=$category&apiKey=$apiKey';
  }

  String movieAndScienceFun({required String movies, required String science}) {
    return "$kBaseUrl/everything?q=$movies&$science&apiKey=$apiKey";
  }

  String categoryFun({required String category}) {
    return "$kBaseUrl/top-headlines?country=in&category=$category&apiKey=$apiKey";
  }
}
