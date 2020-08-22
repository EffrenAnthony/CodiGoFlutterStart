import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                Padding(
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
                ),
                Container(
                  height: 405,
                  child: TabBarView(children: [
                    ListView.builder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        }),
                    Text("Tab3"),
                    Text("Tab4"),
                    Text("Tab5"),
                  ]),
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
                      'rank | Profesional',
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
