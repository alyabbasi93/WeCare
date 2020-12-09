import 'package:healthcare/Model/hospitalModel.dart';
import 'package:http/http.dart' as http;

class HospitalServices {
  //define url
  static const String url =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=33.684422,73.047882&radius=1500&type=hospital&key=key';

  // Create function to get data and save in Models

  static Future<HospitalModel> gethospitals() async {
    try {
      final response =
          await http.get(url, headers: {'Accept': 'application/json'});
      print(response.body);
      if (200 == response.statusCode) {
        final HospitalModel users = hospitalModelFromJson(response.body);
        return users;
      } else {
        return HospitalModel();
      }
    } catch (e) {
      return HospitalModel();
    }
  }
}
