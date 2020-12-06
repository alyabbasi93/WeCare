import 'package:healthcare/Model/ExerciseModel.dart';
import 'package:http/http.dart' as http;

class ExerciseServices {

  //define url
  static const String url =
      'https://wecare2021.000webhostapp.com/wp-json/wp/v2/posts?categories=2';

// Create function to get data and save in Models

  static Future<List<ExerciseModels >> getexercise() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final List<ExerciseModels> users = exerciseFromJson(response.body);
        return users;
      } else {
        return List<ExerciseModels>();
      }
    } catch (e) {
      return List<ExerciseModels>();
    }
  }
}
