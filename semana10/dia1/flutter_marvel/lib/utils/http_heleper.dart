import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_marvel/models/comic.dart';
import 'package:flutter_marvel/models/super_heroe.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlBase = 'https://gateway.marvel.com/v1/public/';
  String publicKey = 'd3c853b3b113c5b3b0ae4230e108442c';
  String privateKey = '4c2240d50a305f5ff3107bb79eae4307e5acb32c';

  Future<List<SuperHeroe>> obtenerSuperHeroes(int page) async {
    page = page - 1;
    String hash =
        md5.convert(utf8.encode("1" + privateKey + publicKey)).toString();

    var response = await http.get(urlBase +
        "characters?apikey=$publicKey&hash=$hash&ts=1&limit=100&offset=${page * 100}");
    List jsonResponse = jsonDecode(response.body)["data"]["results"];
    List<SuperHeroe> heroes =
        jsonResponse.map((e) => SuperHeroe.fromJson(e)).toList();

    print(response.body);
    return heroes;
  }

  Future<Comic> obtenerComic(String url) async {
    String hash =
        md5.convert(utf8.encode("1" + privateKey + publicKey)).toString();

    var response = await http.get("$url?apikey=$publicKey&hash=$hash&ts=1");
    print(response.body);
    var jsonResponse = jsonDecode(response.body)["data"]["results"][0];
    Comic comic = Comic.fromJson(jsonResponse);

    return comic;
  }
}
