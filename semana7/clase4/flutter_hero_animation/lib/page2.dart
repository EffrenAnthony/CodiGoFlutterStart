import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppHero'),
        ),
        body: Center(
          child: Hero(
            tag: 'etiquetaIcono',
            child: Icon(
              Icons.ac_unit,
              color: Colors.deepPurpleAccent,
              size: 200,
            ),
          ),
        ));
  }
}
