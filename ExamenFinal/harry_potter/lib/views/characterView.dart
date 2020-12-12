import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class CharacterView extends StatefulWidget {
  Character personaje;
  CharacterView(this.personaje);

  @override
  _CharacterViewState createState() => _CharacterViewState(personaje);
}

class _CharacterViewState extends State<CharacterView> {
  Character personaje;
  _CharacterViewState(this.personaje);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personaje.name),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: personaje.house.toLowerCase() == 'gryffindor'
                        ? AssetImage('assets/gryffindor.jpg')
                        : personaje.house.toLowerCase() == 'hufflepuff'
                            ? AssetImage(
                                'assets/hufflepuff.jpg',
                              )
                            : personaje.house.toLowerCase() == 'ravenclaw'
                                ? AssetImage(
                                    'assets/ravenclaw.jpg',
                                  )
                                : AssetImage(
                                    'assets/slytherin.jpg',
                                  ),
                    // NetworkImage(
                    //     'https://i.pinimg.com/474x/d6/31/a5/d631a5573487d92df28572662b181b5c.jpg'
                    //     // 'https://i.pinimg.com/originals/4d/70/06/4d7006e10b9234df8bbea55a62d395ef.gif',
                    //     ),
                    fit: BoxFit.fill)),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 350,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              personaje.image,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 190, top: 270),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(50)),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            child: personaje.hogwartsStaff
                                ? Icon(
                                    Icons.grade,
                                    color: Colors.amber,
                                    size: 40,
                                  )
                                : Icon(
                                    Icons.person,
                                    color: Colors.blueAccent.shade700,
                                    size: 40,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: Colors.black87,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ' + personaje.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Species: ' + personaje.species,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Date of birth: ' + personaje.dateOfBirth,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Hogwarts member type: ' +
                              (personaje.hogwartsStaff
                                  ? 'Hogwarts Staff'
                                  : 'Student'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Ancestry: ' + personaje.ancestry,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Gender: ' + personaje.gender,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'House: ' + personaje.house,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Patronus: ' + personaje.patronus,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Actor: ' + personaje.actor,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Eye Colour: ' + personaje.eyeColour,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Hair Colour: ' + personaje.hairColour,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Activity: ' + (personaje.alive ? 'Alive' : 'Dead'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
