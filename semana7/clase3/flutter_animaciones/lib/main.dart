import 'package:flutter/material.dart';
import 'package:flutter_animaciones/widget/animated_balloon.dart';
import 'package:flutter_animaciones/widget/animated_container.dart';
import 'package:flutter_animaciones/widget/animated_cross_fade.dart';
import 'package:flutter_animaciones/widget/animated_opacity.dart';

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
      home: Animaciones(),
    );
  }
}

class Animaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animaciones"),
      ),
      // body: AnimatedContainerWidget());
      // body: AnimatedCrossFaceWidget());
      // body: AnimatedOpacityWidget(),
      body: AnimatedBalloonWidget(),
    );
  }
}
