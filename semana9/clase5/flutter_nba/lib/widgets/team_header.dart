import 'package:flutter/material.dart';
import 'package:flutter_nba/models/equipo.dart';

class TeamHeader extends StatefulWidget {
  Equipo equipo;
  String url;
  TeamHeader(this.equipo, this.url);

  @override
  _TeamHeaderState createState() => _TeamHeaderState(equipo, url);
}

class _TeamHeaderState extends State<TeamHeader> {
  Equipo equipo;
  String url;
  _TeamHeaderState(this.equipo, this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            url,
            height: 200,
          ),
          // Text(
          //   equipo.fullName,
          //   style: TextStyle(fontSize: 18),
          // )
        ],
      ),
    );
  }
}
