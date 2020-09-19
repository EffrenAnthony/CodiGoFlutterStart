import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/equipo.dart';
import 'package:flutter_nba/routes/games_played.dart';
import 'package:flutter_nba/routes/players_team.dart';
import 'package:flutter_nba/util/httpHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/61sdYZGwvUL._AC_SL1001_.jpg'),
                    fit: BoxFit.fill)),
          ),
          Center(
            child: FutureBuilder<List<Equipo>>(
              future: HttpHelper().fetchEquipo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CarouselSlider(
                    options: CarouselOptions(height: 470.0),
                    items: snapshot.data.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  i.conference + '-' + i.division,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                Image.network(getImageUrlByName(i.fullName)),
                                Text(
                                  i.abbreviation,
                                  style: TextStyle(
                                    fontSize: 35.0,
                                  ),
                                ),
                                Text(
                                  i.fullName,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.black87,
                                      child: Text(
                                        'Jugadores',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayersPerTeam(i),
                                            ));
                                      },
                                    ),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.black87,
                                      child: Text(
                                        'Ultimos Partidos',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GamesPlayed(i),
                                            ));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                } else if (snapshot.hasError) {
                  return (snapshot.error);
                }
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
