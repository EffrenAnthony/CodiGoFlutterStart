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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  Calculadora({Key key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: Text('Calculadora'),
      ),
      body: Column(
        children: [
          Expanded(child: Text('0')),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('7'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('8'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('9'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('/'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('4'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('5'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('6'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('*'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('3'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('2'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('1'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('-'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('.'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('0'),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('='),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('+'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
