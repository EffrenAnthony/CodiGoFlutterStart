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
      home: DemoInputs(),
    );
  }
}

class DemoInputs extends StatefulWidget {
  @override
  _DemoInputsState createState() => _DemoInputsState();
}

class _DemoInputsState extends State<DemoInputs> {
  String valorTexto = '';
  String textoInvertido = '';
  @override
  Widget build(BuildContext context) {
    // este controlador, se encarga de controlar el estado del textflied
    TextEditingController _controller =
        TextEditingController(text: 'Escribe algo...');
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  valorTexto = _controller.text;
                  // String invertido = '';
                  // for (var i = 0; i < valorTexto.length; i++) {
                  //   invertido += valorTexto[valorTexto.length - 1 - i];
                  // }
                  // textoInvertido = invertido;
                });
              },
              child: Text('prueba'),
            )
          ],
        ),
        Text(valorTexto.split('').reversed.join())
      ],
    ));
  }
}
