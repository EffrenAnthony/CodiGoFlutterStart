import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaPerfil2());
  }
}

class PaginaPerfil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80)),
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade400,
                  Colors.orangeAccent.shade100,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: 400,
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text(
                  'Date mate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 240,
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          'https://images.pexels.com/photos/372042/pexels-photo-372042.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '3.7 km away',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Vanessa - 25',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  // dentor del row y el column puede poenrse este mainxis y el crossaxis
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 17,
                      color: Colors.grey,
                    ),
                    Text(
                      'San Francisco California USA',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.instagram),
                    SizedBox(width: 25),
                    Icon(FontAwesomeIcons.facebookF),
                    SizedBox(width: 25),
                    Icon(FontAwesomeIcons.twitter),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
