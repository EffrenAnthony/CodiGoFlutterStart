import 'dart:convert';

import 'package:miloficios_app/models/banner.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlBase = 'http://192.168.0.14:8000/API/';

  Future<List<Categoria>> fetchCategorias() async {
    var response = await http.get(urlBase + 'categoriasList');
    List categoriasJson = jsonDecode(response.body);
    return categoriasJson.map((e) => Categoria.fromJson(e)).toList();
  }

  Future<List<BannerPublicitario>> fetchBannersPublicitarios() async {
    var response = await http.get(urlBase + 'bannerspublicitarios');
    List bannersJson = jsonDecode(response.body);
    return bannersJson.map((e) => BannerPublicitario.fromJson(e)).toList();
  }

  Future<String> iniciarSesion(String username, String password) async {
    var response = await http.post(urlBase + "token-auth/",
        body: {"username": username, "password": password});
    print(response.toString());
    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)["token"];
      print(token.toString());
      return token;
    }
    return "";
  }
}
