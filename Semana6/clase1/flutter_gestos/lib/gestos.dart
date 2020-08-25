import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DetectorGestos(),
    );
  }
}

class DetectorGestos extends StatefulWidget {
  @override
  _DetectorGestosState createState() => _DetectorGestosState();
}

class _DetectorGestosState extends State<DetectorGestos> {
  int _contador = 0;
  int _contador2 = 0;
  int _contador3 = 0;
  Offset _offsetVertical = Offset.zero;
  bool _scrollingVertical = true;
  Offset _offsetHorizontal = Offset.zero;
  bool _scrollingHorizontal = true;
  Offset _offsetPan = Offset.zero;
  bool _scrollingPan = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _contador++;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 100,
              color: Colors.grey,
              child: Text('$_contador'),
            ),
          ),
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                _contador2++;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              color: Colors.grey,
              child: Text('$_contador2'),
            ),
          ),
          // mantener precionado suma 1
          GestureDetector(
            onLongPress: () {
              setState(() {
                _contador3++;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              color: Colors.grey,
              child: Text('$_contador3'),
            ),
          ),
          GestureDetector(
            onVerticalDragStart: (details) {
              setState(() {
                _scrollingVertical = true;
              });
            },
            onVerticalDragEnd: (details) {
              setState(() {
                _scrollingVertical = false;
              });
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                _offsetVertical += details.delta;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              color: Colors.grey,
              child: Center(
                child: Transform.translate(
                  offset: _offsetVertical,
                  child: Text(_scrollingVertical ? 'Drag' : 'Stop'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: (details) {
              setState(() {
                _scrollingHorizontal = true;
              });
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                _scrollingHorizontal = false;
              });
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                _offsetHorizontal += details.delta;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              color: Colors.grey,
              child: Center(
                child: Transform.translate(
                  offset: _offsetHorizontal,
                  child: Text(_scrollingHorizontal ? 'Drag' : 'Stop'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                _scrollingPan = true;
              });
            },
            onPanEnd: (details) {
              setState(() {
                _scrollingPan = false;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                _offsetPan += details.delta;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              color: Colors.grey,
              child: Center(
                child: Transform.translate(
                  offset: _offsetPan,
                  child: Text(_scrollingPan ? 'Drag' : 'Stop'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
