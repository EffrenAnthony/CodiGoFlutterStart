import 'dart:convert';

import 'package:flutter_nba/models/equipo.dart';
import 'package:flutter_nba/models/jugador.dart';
import 'package:flutter_nba/models/partido.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String baseUrl = 'https://www.balldontlie.io/api/v1/';

  Future<List<Equipo>> fetchEquipo() async {
    var response = await http.get(baseUrl + 'teams');
    if (response.statusCode == 200) {
      List equipos = jsonDecode(response.body)['data'];
      List<Equipo> listeq = [];
      // return equipos.map((e) => Equipo.fromJson(e)).toList();
      for (var i = 0; i < equipos.length; i++) {
        listeq.add(Equipo.fromJson(equipos[i]));
      }
      return listeq;
    } else {
      print('Error obteniendo equipos');
      return [];
    }
  }

  Future<List<Jugador>> fetchJugadoresPorEquipo(String equipo) async {
    if (equipo == "76ers") equipo = "sixers";
    if (equipo == "trail blazers") equipo = "blazers";

    var response = await http
        .get("http://data.nba.net/json/cms/noseason/team/$equipo/roster.json");
    if (response.statusCode == 200) {
      List jugadores = jsonDecode(response.body)["sports_content"]["roster"]
          ["players"]["player"];
      return jugadores.map((e) => Jugador.fromJson(e)).toList();
    } else {
      print("Error obteniendo Equipos");
      return [];
    }
  }

  Future<List<Partido>> fetchPartidosPorEquipo(int id) async {
    // if (equipo == "76ers") equipo = "sixers";
    // if (equipo == "trail blazers") equipo = "blazers";

    var response =
        await http.get(baseUrl + "games?seasons[]=2019&team_ids[]=$id");
    if (response.statusCode == 200) {
      List jugadores = jsonDecode(response.body)["data"];
      // jugadores.sort();
      return jugadores.map((e) => Partido.fromJson(e)).toList();
    } else {
      print("Error obteniendo Equipos");
      return [];
    }
  }
}
