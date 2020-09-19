// To parse this JSON data, do
//
//     final partido = partidoFromJson(jsonString);

import 'dart:convert';

Partido partidoFromJson(String str) => Partido.fromJson(json.decode(str));

String partidoToJson(Partido data) => json.encode(data.toJson());

class Partido {
  Partido({
    this.id,
    this.date,
    this.homeTeam,
    this.homeTeamScore,
    this.period,
    this.postseason,
    this.season,
    this.status,
    this.time,
    this.visitorTeam,
    this.visitorTeamScore,
  });

  int id;
  DateTime date;
  Team homeTeam;
  int homeTeamScore;
  int period;
  bool postseason;
  int season;
  String status;
  String time;
  Team visitorTeam;
  int visitorTeamScore;

  factory Partido.fromJson(Map<String, dynamic> json) => Partido(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        homeTeam: Team.fromJson(json["home_team"]),
        homeTeamScore: json["home_team_score"],
        period: json["period"],
        postseason: json["postseason"],
        season: json["season"],
        status: json["status"],
        time: json["time"],
        visitorTeam: Team.fromJson(json["visitor_team"]),
        visitorTeamScore: json["visitor_team_score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "home_team": homeTeam.toJson(),
        "home_team_score": homeTeamScore,
        "period": period,
        "postseason": postseason,
        "season": season,
        "status": status,
        "time": time,
        "visitor_team": visitorTeam.toJson(),
        "visitor_team_score": visitorTeamScore,
      };
}

class Team {
  Team({
    this.id,
    this.abbreviation,
    this.city,
    this.conference,
    this.division,
    this.fullName,
    this.name,
  });

  int id;
  String abbreviation;
  String city;
  String conference;
  String division;
  String fullName;
  String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conference,
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}
