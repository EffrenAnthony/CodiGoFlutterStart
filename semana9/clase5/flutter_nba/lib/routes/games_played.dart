import 'package:flutter/material.dart';
import 'package:flutter_nba/models/equipo.dart';
import 'package:flutter_nba/util/httpHelper.dart';
import 'package:flutter_nba/widgets/team_header.dart';
import 'package:intl/intl.dart';

class GamesPlayed extends StatefulWidget {
  Equipo equipo;
  GamesPlayed(this.equipo);
  @override
  _GamesPlayedState createState() => _GamesPlayedState(equipo);
}

class _GamesPlayedState extends State<GamesPlayed> {
  Equipo equipo;
  _GamesPlayedState(this.equipo);
  String imageBaseUrl = 'http://loodibee.com/wp-content/uploads/';

  String getImageUrlByName(String name) {
    if (name == "Denver Nuggets")
      return "http://loodibee.com/wp-content/uploads/nba-denver-nuggets-logo-2018-300x300.png";
    if (name == "LA Clippers")
      return "http://loodibee.com/wp-content/uploads/nba-la-clippers-logo-png-300x300.png";
    name = name.replaceAll(' ', '-').toLowerCase();
    name = 'nba-$name-logo.png';
    return imageBaseUrl + name;
  }

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(date);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://ak.picdn.net/shutterstock/videos/18325363/thumb/1.jpg'),
                fit: BoxFit.fill),
          ),
        ),
        Column(
          children: [
            TeamHeader(equipo, getImageUrlByName(equipo.fullName)),
            FutureBuilder(
                future: HttpHelper().fetchPartidosPorEquipo(equipo.id),
                builder: (context, snapshot) {
                  List partidos = snapshot.data;
                  if (snapshot.hasData) {
                    partidos.sort((a, b) => b.date.compareTo(a.date));
                    return Expanded(
                      child: ListView.builder(
                        itemCount: partidos.length,
                        itemBuilder: (c, i) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            height: 130,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    formatDate(partidos[i].date),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          getImageUrlByName(partidos[i]
                                              .homeTeam
                                              .fullName
                                              .toString()),
                                          height: 50,
                                        ),
                                        Text(
                                          partidos[i]
                                              .homeTeam
                                              .abbreviation
                                              .toString(),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                partidos[i]
                                                    .homeTeamScore
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20)),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text('-'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                                partidos[i]
                                                    .visitorTeamScore
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          partidos[i].homeTeamScore >
                                                  partidos[i].visitorTeamScore
                                              ? 'W'
                                              : 'L',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.network(
                                          getImageUrlByName(partidos[i]
                                              .visitorTeam
                                              .fullName
                                              .toString()),
                                          height: 50,
                                        ),
                                        Text(
                                          partidos[i]
                                              .visitorTeam
                                              .abbreviation
                                              .toString(),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ],
    ));
  }
}
