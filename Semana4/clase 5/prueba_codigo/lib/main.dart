import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaPerfil());
  }
}

class PaginaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigoAccent.shade100,
                  Colors.indigoAccent.shade700,
                ],
              ),
            ),
          ),
          Column(
            children: [
              buildHeader(context),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Collection',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text('Create new'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      height: 240,
      // El stack permite superponer elementos, es una lsita con elementos donde todos empiezan al mismo nivel
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 40, top: 40),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Anthony Peña',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('CEO | PooPaye SAC'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://live.staticflickr.com/65535/50242998231_11e10a6261_c.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
