import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/services/dioConection.dart';
import 'package:harry_potter/views/characterView.dart';

class HouseOverview extends StatefulWidget {
  String nombreCasa;
  HouseOverview(this.nombreCasa);

  @override
  _HouseOverviewState createState() => _HouseOverviewState(nombreCasa);
}

class _HouseOverviewState extends State<HouseOverview> {
  String nombreCasa;
  _HouseOverviewState(this.nombreCasa);
  List<Character> personajes = [];

  @override
  void initState() {
    buildHouseOverview();
    super.initState();
  }

  buildHouseOverview() {
    DioHelper().getHouse(nombreCasa.toLowerCase()).then((value) {
      setState(() {
        personajes = value;
        print(personajes.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombreCasa),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/hogwartsBackground.jpg'),
                    // NetworkImage(
                    //     'https://i.pinimg.com/474x/d6/31/a5/d631a5573487d92df28572662b181b5c.jpg'
                    //     // 'https://i.pinimg.com/originals/4d/70/06/4d7006e10b9234df8bbea55a62d395ef.gif',
                    //     ),
                    fit: BoxFit.fill)),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: nombreCasa.toLowerCase() == 'gryffindor'
                      ? Image.asset('assets/gryffindor.jpg', fit: BoxFit.cover)
                      : nombreCasa.toLowerCase() == 'hufflepuff'
                          ? Image.asset('assets/hufflepuff.jpg',
                              fit: BoxFit.cover)
                          : nombreCasa.toLowerCase() == 'ravenclaw'
                              ? Image.asset('assets/ravenclaw.jpg',
                                  fit: BoxFit.cover)
                              : Image.asset('assets/slytherin.jpg',
                                  fit: BoxFit.cover),
                ),
              ),
              personajes.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: personajes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.black87,
                            child: Container(
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CharacterView(personajes[index]),
                                        ));
                                  },
                                  title: Text(personajes[index].name,
                                      style: TextStyle(color: Colors.white)),
                                  subtitle: Text(
                                      'Specie: ' +
                                          personajes[index]
                                              .species
                                              .toUpperCase(),
                                      style: TextStyle(color: Colors.white)),
                                  trailing: personajes[index].hogwartsStaff
                                      ? Icon(
                                          Icons.grade,
                                          color: Colors.amber,
                                        )
                                      : Icon(
                                          Icons.person,
                                          color: Colors.blueAccent.shade700,
                                        ),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                      personajes[index].image,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ],
      ),
    );
  }
}
