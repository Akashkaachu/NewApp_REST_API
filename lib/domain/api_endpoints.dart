import 'package:mini/core/api_key/api_key.dart';
import 'package:mini/core/string/string.dart';

class ApiEndPoints {
  String searchUrlFunc({required String query}) {
    return '$kBaseUrl/everything?q=$query&apiKey=$apiKey';
  }
}
