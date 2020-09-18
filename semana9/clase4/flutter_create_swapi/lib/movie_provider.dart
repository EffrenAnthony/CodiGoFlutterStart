import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_create_swapi/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  Movie movie;

  Future fetchMovie(int id) async {
    var response = await http.get('https://swapi.dev/api/films/$id/');
    if (response.statusCode == 200) {
      movie = Movie.fromJson(jsonDecode(response.body));
    }
    notifyListeners();
  }
}
