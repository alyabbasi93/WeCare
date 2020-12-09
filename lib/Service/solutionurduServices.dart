import 'package:healthcare/Model/SolutionModel.dart';
import 'package:http/http.dart' as http;

class solutionurduServices {
  //define url
  static const String url =
      'https://wecare2021.000webhostapp.com/wp-json/wp/v2/posts?categories=9';

  // Create function to get data and save in Models

  static Future<List<SolutionModel>> geturdusolution() async {
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
