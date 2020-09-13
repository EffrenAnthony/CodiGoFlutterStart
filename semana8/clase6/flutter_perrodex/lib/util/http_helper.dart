import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpHelper {
  String baseUrl = 'https://dog.ceo/api/breed';

  Future<List> getDogs() async {
    var response = await http.get(baseUrl + "s/list/all");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Map dogs = jsonResponse['message'];
      List dogsNames = [];
      dogs.forEach(
        (key, value) {
          dogsNames.add(key);
        },
      );
      return dogsNames;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getDogImage(String breed) async {
    var response = await http.get(baseUrl + "/" + breed + "/images/random");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      String url = jsonResponse['message'];

      return url;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getDogImages(String breed) async {
    var response = await http.get(baseUrl + "/" + breed + "/images/random/16");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List urls = jsonResponse['message'];

      return urls;
    } else {
      print(response.statusCode);
    }
  }
}
