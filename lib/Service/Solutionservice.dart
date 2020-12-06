import 'package:healthcare/Model/SolutionModel.dart';
import 'package:http/http.dart' as http;

class solutionServices {
  static const String url =
      'https://wecare2021.000webhostapp.com/wp-json/wp/v2/posts?categories=4';

  static Future<List<SolutionModel>> getsolution() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final List<SolutionModel> users = solutionModelFromJson(response.body);
        return users;
      } else {
        return List<SolutionModel>();
      }
    } catch (e) {
      return List<SolutionModel>();
    }
  }
}
