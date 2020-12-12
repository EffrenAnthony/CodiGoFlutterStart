import 'package:dio/dio.dart';
import 'package:harry_potter/models/character.dart';

class DioHelper {
  String baseUrl = 'http://hp-api.herokuapp.com/api/characters/';

  Future<List<Character>> getHouse(String house) async {
    print(house);
    // try {
    Response response = await Dio().get(baseUrl + 'house/' + house);
    List data = response.data;

    print(data);
    List<Character> characters = [];
    for (var character in data) {
      Character personaje = Character.fromJson(character);
      print(personaje.name);
      characters.add(personaje);
    }

    print(characters.length);
    return characters;
    // } catch (e) {
    //   print(e);
    // }
  }
}
