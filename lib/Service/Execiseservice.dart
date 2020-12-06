import 'package:healthcare/Model/ExerciseModel.dart';
import 'package:http/http.dart' as http;

class ExerciseServices {
  static const String url =
      'https://wecare2021.000webhostapp.com/wp-json/wp/v2/posts?categories=2';

  static Future<List<Exercise>> getexercise() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final List<Exercise> users = exerciseFromJson(response.body);
        return users;
      } else {
        return List<Exercise>();
      }
    } catch (e) {
      return List<Exercise>();
    }
  }
}
