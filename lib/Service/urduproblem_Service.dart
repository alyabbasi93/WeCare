import 'package:healthcare/Model/ProblemsModels.dart';
import 'package:http/http.dart' as http;

class ProblemsurduServices {
  //define url
  static const String url =
      'https://wecare2021.000webhostapp.com/wp-json/wp/v2/posts?categories=8';

// Create function to get data and save in Models

  static Future<List<ProblemsModels>> getproblemsurdu() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final List<ProblemsModels> users =
            problemsModelsFromJson(response.body);
        return users;
      } else {
        return List<ProblemsModels>();
      }
    } catch (e) {
      return List<ProblemsModels>();
    }
  }
}
