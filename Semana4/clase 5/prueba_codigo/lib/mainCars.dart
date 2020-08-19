import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaAutos(nombre: "AppAutos"));
  }
}

class PaginaAutos extends StatelessWidget {
  String nombre;

  PaginaAutos({this.nombre});

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueAccent,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text("VW"),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Refractor, extract method -> Sirve para envolver en un metodo todo el widget
              buildAutoCard(),
              // Refract, extract Local Variable -> Lo extrae en una variable
              card,
              // lo extrae en una clase
              WidgetCardAuto(
                marca: 'Toyoya',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildAutoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.redAccent,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text("VW"),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCardAuto extends StatelessWidget {
  final String marca;
  const WidgetCardAuto({
    Key key,
    this.marca,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.greenAccent,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text(marca),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
