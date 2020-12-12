import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/views/houseOverview.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: SplashScreen(
        imageBackground: AssetImage("assets/lumus.gif"),
        seconds: 7,
        navigateAfterSeconds: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AssetImage> houses = [AssetImage('assets/lumus.gif')];
  List<String> housesName = [
    'Gryffindor',
    'Hufflepuff',
    'Ravenclaw',
    'Slytherin'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: CarouselSlider(
                    options:
                        CarouselOptions(height: 470.0, enlargeCenterPage: true),
                    items: housesName.map((i) {
                      return Builder(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HouseOverview(i),
                                    ));
                                print(i);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                // decoration: BoxDecoration(
                                //     color: Colors.red,
                                //     borderRadius: BorderRadius.circular(20)),
                                // height: 350,
                                child: i.toLowerCase() == 'gryffindor'
                                    ? Image.asset('assets/gryffindor.jpg',
                                        fit: BoxFit.cover)
                                    : i.toLowerCase() == 'hufflepuff'
                                        ? Image.asset('assets/hufflepuff.jpg',
                                            fit: BoxFit.cover)
                                        : i.toLowerCase() == 'ravenclaw'
                                            ? Image.asset(
                                                'assets/ravenclaw.jpg',
                                                fit: BoxFit.cover)
                                            : Image.asset(
                                                'assets/slytherin.jpg',
                                                fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
