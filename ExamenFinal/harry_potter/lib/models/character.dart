// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.name,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alive,
    this.image,
  });

  String name;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  int yearOfBirth;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand wand;
  String patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  bool alive;
  String image;

  Character.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.species = json["species"];
    this.gender = json["gender"];
    this.house = json["house"];

    this.dateOfBirth = json["dateOfBirth"].toString().length > 0
        ? json["dateOfBirth"]
        : 'Unknown';
    this.yearOfBirth =
        json["yearOfBirth"].toString().length > 0 ? json["yearOfBirth"] : 2000;
    this.ancestry =
        json["ancestry"].toString().length > 0 ? json["ancestry"] : 'Unknown';
    this.eyeColour = json["eyeColour"];
    hairColour = json["hairColour"];
    // wand= Wand.fromJson(json["wand"]);
    this.patronus =
        json["patronus"].toString().length > 0 ? json["patronus"] : 'Unknown';
    this.hogwartsStudent = json["hogwartsStudent"];
    this.hogwartsStaff = json["hogwartsStaff"];
    this.actor = json["actor"];
    this.alive = json["alive"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "species": species,
        "gender": gender,
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alive": alive,
        "image": image,
      };
}

class Wand {
  Wand({
    this.wood,
    this.core,
    this.length,
  });

  String wood;
  String core;
  int length;

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}
