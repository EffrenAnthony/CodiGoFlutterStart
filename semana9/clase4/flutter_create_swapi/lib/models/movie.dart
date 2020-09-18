// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });

  String title;
  int episodeId;
  String openingCrawl;
  String director;
  String producer;
  DateTime releaseDate;
  List<String> characters;
  List<String> planets;
  List<String> starships;
  List<String> vehicles;
  List<String> species;
  DateTime created;
  DateTime edited;
  String url;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        episodeId: json["episode_id"],
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: DateTime.parse(json["release_date"]),
        characters: List<String>.from(json["characters"].map((x) => x)),
        planets: List<String>.from(json["planets"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "episode_id": episodeId,
        "opening_crawl": openingCrawl,
        "director": director,
        "producer": producer,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "planets": List<dynamic>.from(planets.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
