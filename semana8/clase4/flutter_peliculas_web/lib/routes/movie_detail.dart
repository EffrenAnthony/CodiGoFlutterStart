import 'package:flutter/material.dart';
import 'package:flutter_peliculas_web/models/movie.dart';

class MovieDetail extends StatelessWidget {
  Movie movie;
  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                tag: movie.posterPath,
                child: Image.network(
                  imageBaseUrl + movie.posterPath,
                  height: 500,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(movie.overview)
            ],
          ),
        ),
      ),
    );
  }
}
