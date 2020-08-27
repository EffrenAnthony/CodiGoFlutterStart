import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

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
      home: Memoria(),
    );
  }
}

class Memoria extends StatefulWidget {
  Memoria({Key key}) : super(key: key);

  @override
  _MemoriaState createState() => _MemoriaState();
}

class _MemoriaState extends State<Memoria> {
  List<String> datos = [];
  double cantidadMovimientos = 0;

  @override
  void initState() {
    int cantidad = 10;
    datos = [
      for (double i = 1; i <= cantidad; i += 0.5) (i).floor().toString()
    ];

    datos.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(cantidadMovimientos.floor().toString()),
            Expanded(
              child: GridView.builder(
                itemCount: datos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) => FlipCard(
                  onFlipDone: (isFront) {
                    setState(() {
                      cantidadMovimientos += 0.5;
                    });
                  },
                  front: Container(
                    color: Colors.redAccent,
                    margin: EdgeInsets.all(8),
                  ),
                  back: Container(
                    color: Colors.blueAccent,
                    margin: EdgeInsets.all(8),
                    child: Center(child: Text(datos[index])),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
