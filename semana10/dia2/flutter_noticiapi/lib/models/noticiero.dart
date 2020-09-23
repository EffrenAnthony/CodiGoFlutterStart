// To parse this JSON data, do
//
//     final noticiero = noticieroFromJson(jsonString);

import 'dart:convert';

Noticiero noticieroFromJson(String str) => Noticiero.fromJson(json.decode(str));

String noticieroToJson(Noticiero data) => json.encode(data.toJson());

class Noticiero {
  Noticiero({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  factory Noticiero.fromJson(Map<String, dynamic> json) => Noticiero(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };
}
