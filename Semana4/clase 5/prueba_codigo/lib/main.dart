import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaTabs());
  }
}

class PaginaTabs extends StatelessWidget {
  final List<String> titulos = [
    "How to seem like you always have your shot together",
    "Does Dry is January Actually improve your health",
    "Yo do hire a designer to make something. Yuo hire them"
  ];
  final List<String> images = [
    "https://images.pexels.com/photos/974964/pexels-photo-974964.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1642228/pexels-photo-1642228.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/919453/pexels-photo-919453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      child: DefaultTabController(
        // Aca se definene todos los controllers ocn lenght, este campo es el unico y es obligatorio y eiene que ir enciam del scaffold
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Categories"),
            leading: Icon(Icons.category),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.pink,
              indicatorColor: Colors.pink,
              unselectedLabelColor: Colors.black,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab2",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab3",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab4",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab5",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab6",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab7",
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: titulos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              color: Colors.pink.shade100,
                            ),
                            Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              color: Colors.white,
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 80,
                                      child: Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    // Expanded permite que este en todo el elemento
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            titulos[index],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text.rich(TextSpan(children: [
                                            WidgetSpan(
                                                child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.pink.shade300,
                                              radius: 7,
                                            )),
                                            WidgetSpan(
                                                child: SizedBox(
                                              width: 5,
                                            )),
                                            TextSpan(
                                                text: "Jhon Vino",
                                                style: TextStyle(fontSize: 14)),
                                            WidgetSpan(
                                                child: SizedBox(
                                              width: 15,
                                            )),
                                            TextSpan(
                                                text: "4 min read ",
                                                style: TextStyle(fontSize: 14))
                                          ])),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Text("Tab2"),
              Text("Tab3"),
              Text("Tab4"),
              Text("Tab5"),
              Text("Tab6"),
              Text("Tab7"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.black,
            currentIndex: 0,
            // fixed es para que se ajusten a la cantidad de botones
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  title: Text('Home'),
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  title: Text('Files'), icon: Icon(Icons.folder)),
              BottomNavigationBarItem(
                  title: Text('Favorites'), icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  title: Text('Profile'), icon: Icon(Icons.portrait)),
              BottomNavigationBarItem(
                  title: Text('Settings'), icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
