import 'package:flutter/material.dart';
import 'package:flutter_nba/models/equipo.dart';
import 'package:flutter_nba/models/jugador.dart';
import 'package:flutter_nba/util/httpHelper.dart';

class PlayersPerTeam extends StatefulWidget {
  Equipo equipo;
  PlayersPerTeam(this.equipo);

  @override
  _PlayersPerTeamState createState() => _PlayersPerTeamState(equipo);
}

class _PlayersPerTeamState extends State<PlayersPerTeam> {
  Equipo equipo;
  _PlayersPerTeamState(this.equipo);
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15)),
            child: FutureBuilder<List<Jugador>>(
              future: HttpHelper()
                  .fetchJugadoresPorEquipo(equipo.name.toLowerCase()),
              builder: (context, snapshot) {
                List<Jugador> jugadores = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://us.123rf.com/450wm/choneschones/choneschones1504/choneschones150400011/39053088-baloncesto-contra-negro.jpg?ver=6'),
                              child: Text(
                                jugadores[index].jerseyNumber,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(jugadores[index].displayName),
                            subtitle: Text(
                                '${jugadores[index].heightFt},${jugadores[index].heightIn} de ${jugadores[index].affiliation}'),
                            trailing: Text(
                              jugadores[index].positionShort,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: jugadores.length);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
