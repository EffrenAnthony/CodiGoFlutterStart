import 'dart:convert';

import 'package:flutter_noticiapi/models/noticia.dart';
import 'package:flutter_noticiapi/models/noticiero.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HttpHelper {
  String baseUrl = "http://newsapi.org/v2/";
  String apiKey = "1573e2bf09b34382b840a371ab080d32";

  Future<List<Noticia>> fetchNoticias(DateTime fecha, String busqueda) async {
    DateFormat formatoFecha = DateFormat("yyyy-MM-dd");
    var response = await http.get(baseUrl +
        "everything?from=${formatoFecha.format(fecha)}&to=${formatoFecha.format(fecha)}&qInTitle=$busqueda&apiKey=" +
        apiKey);
    List noticiasJson = jsonDecode(response.body)["articles"];
    List noticias = noticiasJson.map((e) => Noticia.fromJson(e)).toList();
    return noticias;
  }

  Future<List<Noticiero>> fetchNoticieros() async {
    var response = await http.get(baseUrl + "sources?&apiKey=" + apiKey);
    List noticierosJson = jsonDecode(response.body)["sources"];
    List noticieros = noticierosJson.map((e) => Noticiero.fromJson(e)).toList();
    return noticieros;
  }
}
