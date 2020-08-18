import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_codigo/widgets/imagen.dart';
// import './widgets/texto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WidgetsPrueba());
  }
}

class WidgetsPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: TextoPrueba());
    return Scaffold(body: ImageButtonPrueba());
  }
}

class MyPage extends StatelessWidget {
  void contactanos(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Contactanos'),
            content: Text('+51 993026178'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el estilo de App que tendremos
    return Scaffold(
      // Scaffold es el empaquetado de la app
      // App bar es el titel de la parte superior
      appBar: AppBar(
        title: Text('Codigo Flutter'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          // Column es un widget que tiene como parametro children que es una lista, y que se extiende a lo largo
          child: Column(
            children: [
              Text(
                'Hola Tony',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textDirection: TextDirection.ltr,
              ),
              Text(
                'Vamos a Programar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
                textDirection: TextDirection.ltr,
              ),
              Image.network(
                'https://images.pexels.com/photos/803940/pexels-photo-803940.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Presioname'),
                  onPressed: () => contactanos(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
