import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Profile());
  }
}

class Profile extends StatelessWidget {
  final List<String> fotos = [
    'https://www.alfabetajuega.com/wp-content/uploads/2019/01/Brawl-Stars.jpg',
    'https://uvejuegos.com/img/caratulas/57900/plants-vs-zombies-heroes-cover.jpg',
    'https://uvejuegos.com/img/caratulas/58452/maxresdefault.jpg',
    'https://www.alfabetajuega.com/wp-content/uploads/2019/01/Brawl-Stars.jpg',
    'https://uvejuegos.com/img/caratulas/57900/plants-vs-zombies-heroes-cover.jpg',
    'https://uvejuegos.com/img/caratulas/58452/maxresdefault.jpg'
  ];
  final List<String> fotos2 = [
    'https://uvejuegos.com/img/caratulas/57900/plants-vs-zombies-heroes-cover.jpg',
    'https://www.alfabetajuega.com/wp-content/uploads/2019/01/Brawl-Stars.jpg',
    'https://pm1.narvii.com/6311/10c7bf26808944d2178f2696b3a32400a732ae10_hq.jpg',
    'https://uvejuegos.com/img/caratulas/57900/plants-vs-zombies-heroes-cover.jpg',
    'https://www.alfabetajuega.com/wp-content/uploads/2019/01/Brawl-Stars.jpg',
    'https://pm1.narvii.com/6311/10c7bf26808944d2178f2696b3a32400a732ae10_hq.jpg',
  ];

  final List<String> missions = [
    'https://img.icons8.com/cute-clipart/2x/goal.png',
    'https://img.icons8.com/bubbles/2x/friends--v4.png',
    'https://img.icons8.com/bubbles/2x/prize.png',
    'https://img.icons8.com/cute-clipart/2x/gift.png',
  ];
  final List<String> missionsName = [
    'Level up 3 times today',
    'Match with 7 new playes',
    'Win 5 medals',
    'Buy 4 widgets',
  ];
  final List<double> missionsBar = [
    200,
    180,
    20,
    120,
  ];
  final List<String> missionsGoals = [
    '3/3',
    '5/7',
    '1/5',
    '3/4',
  ];
  final List<IconData> missionsIcons = [
    Icons.check,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
  ];
  final List<bool> missionsStatus = [
    true,
    false,
    false,
    false,
  ];

  final List<String> awards = [
    'https://uvejuegos.com/img/caratulas/57900/plants-vs-zombies-heroes-cover.jpg',
    'https://pm1.narvii.com/6311/10c7bf26808944d2178f2696b3a32400a732ae10_hq.jpg',
    'https://www.alfabetajuega.com/wp-content/uploads/2019/01/Brawl-Stars.jpg',
    'https://uvejuegos.com/img/caratulas/58452/maxresdefault.jpg',
  ];
  final List<String> awardsName = [
    'Best seller',
    'Year gamer',
    'Month player',
    'Best Dancer',
  ];

  final List<String> awardGroup = [
    'General Goals',
    'Games Awards',
    'Optionals',
  ];
  final List<IconData> awardIcons = [
    Icons.beach_access,
    Icons.blur_circular,
    Icons.group_work,
  ];

  final List<String> statisticsGroup = [
    'General',
    'In games',
  ];
  final List<String> statisticsName = [
    'Science',
    'Cloud',
    'Mining',
    'Exp',
  ];

  final List<double> statisticsValue = [
    50,
    100,
    25,
    75,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildHeaderProfile(),
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                buildTabControllers(),
                Container(
                  height: 420,
                  child: TabBarView(
                    children: [
                      buildTab1(),
                      buildTab2(),
                      buildTab3(),
                      ListView.builder(
                        itemCount: statisticsGroup.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey.shade100,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      statisticsGroup[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: awardsName.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          width: 170,
                                          height: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Card(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Container(
                                                                height: 30,
                                                                width: 30,
                                                                child: Image.network(
                                                                    missions[
                                                                        index]),
                                                              ),
                                                              Text(
                                                                statisticsName[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                          new CircularPercentIndicator(
                                                            radius: 100.0,
                                                            lineWidth: 8.0,
                                                            percent:
                                                                statisticsValue[
                                                                        index] /
                                                                    100,
                                                            center: new Text(
                                                                "${statisticsValue[index].toString()}%"),
                                                            progressColor: statisticsValue[
                                                                        index] <=
                                                                    25
                                                                ? Colors
                                                                    .redAccent
                                                                : statisticsValue[
                                                                            index] <=
                                                                        50
                                                                    ? Colors
                                                                        .orangeAccent
                                                                    : statisticsValue[index] <=
                                                                            75
                                                                        ? Colors
                                                                            .greenAccent
                                                                        : statisticsValue[index] <=
                                                                                100
                                                                            ? Colors.blueAccent
                                                                            : Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: 3,
        // fixed es para que se ajusten a la cantidad de botones
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              title: Text('Cart'), icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              title: Text('Add new'), icon: Icon(Icons.add)),
          BottomNavigationBarItem(
              title: Text('Profile'), icon: Icon(FontAwesomeIcons.userAlt)),
        ],
      ),
    );
  }

  ListView buildTab3() {
    return ListView.builder(
      itemCount: awardGroup.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            // height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        awardGroup[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        awardIcons[index],
                        color: Colors.deepPurpleAccent.shade700,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Row(
                  children: List<Widget>.generate(
                    awards.length,
                    (index) => Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Material(
                              elevation: 5,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 25,
                                backgroundImage: NetworkImage(awards[index]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                awardsName[index],
                                style: TextStyle(fontSize: 11.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildTab2() {
    return ListView.builder(
      itemCount: missionsBar.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              // height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mission ${index + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        missionsStatus[index] == true
                            ? Icon(
                                missionsIcons[index],
                                color: Colors.greenAccent.shade700,
                                size: 15,
                              )
                            : Icon(
                                missionsIcons[index],
                                color: Colors.grey.shade500,
                                size: 15,
                              )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35,
                          backgroundImage: NetworkImage(missions[index]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Text(
                                missionsName[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  height: 5,
                                  width: 200,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                  width: missionsBar[index],
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.deepPurpleAccent.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('completed: ' + missionsGoals[index]),
                        Container(
                          height: 25,
                          width: 70,
                          child: missionsStatus[index] == true
                              ? RaisedButton(
                                  child: Text(
                                    'Claim',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.redAccent),
                                  ),
                                )
                              : RaisedButton(
                                  child: Text(
                                    'Claim',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  color: Colors.grey.shade500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.grey.shade500),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  ListView buildTab1() {
    return ListView.builder(
        itemCount: fotos.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 130,
            height: 130,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            fotos[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            fotos2[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Padding buildTabControllers() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.redAccent,
        indicatorColor: Colors.deepPurpleAccent.shade700,
        unselectedLabelColor: Colors.black,
        tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Games",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Missions",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Goals",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Statistics",
            ),
          ),
        ],
      ),
    );
  }

  Padding buildHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        // color: Colors.blue,
        child: Row(
          children: [
            // SizedBox(
            //   height: 150,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  Material(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://live.staticflickr.com/65535/50242998231_11e10a6261_c.jpg'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 65),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                        Text(
                          '27',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                // color: Colors.blue.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anthony Peña',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'rank | Professional',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey.shade600),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 5,
                          width: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                          width: 80,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {},
      ),
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.monetization_on),
          color: Colors.yellow.shade900,
          onPressed: () {},
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              '2050',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
