import 'dart:convert';
import 'dart:io';
import 'package:flutter_peliculas_web/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlKey = "api_key=bda89372fe0b9050bde8f10394f1ed45";
  String urlBase = "https://api.themoviedb.org/3/movie";
  String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?';
  String urlUpcoming = "/upcoming?";
  String urlLanguage = "&language=en-US";

  Future<List> getUpcoming() async {
    String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      dynamic jsonResponse = json.decode(result.body);
      dynamic moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title) async {
    String query = urlSearchBase + urlKey + "&query=" + title;
    http.Response result = await http.get(query);
    if (result.statusCode == HttpStatus.ok) {
      dynamic jsonResponse = json.decode(result.body);
      dynamic moviesMap = jsonResponse["results"];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
