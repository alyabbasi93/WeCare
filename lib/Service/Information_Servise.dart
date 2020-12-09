import 'package:healthcare/Model/InformationModel.dart';
import 'package:http/http.dart' as http;

class informationServices {
  //define url
  static const String url =
      'https://wecare2021.000webhostapp.com/bot/health.php';

// Create function to get data and save in Models

  static Future<List<InformationModel>> getinformation() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final List<InformationModel> users =
            informationModelFromJson(response.body);
        return users;
      } else {
        return List<InformationModel>();
      }
    } catch (e) {
      return List<InformationModel>();
    }
  }
}
