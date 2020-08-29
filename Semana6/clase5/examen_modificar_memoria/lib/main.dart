import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Memoria(),
    );
  }
}

class Memoria extends StatefulWidget {
  @override
  _MemoriaState createState() => _MemoriaState();
}

class _MemoriaState extends State<Memoria> {
  Timer timer;
  int tiempo = 0;
  List<Tarjeta> tarjetas = [];
  int cantidadTarjetas = 10;
  double cantMovimientos = 0;
  double puntaje = 0;
  List<int> valoresGanador = [];
  // int cantValores = 5;

  int primerValor = -1;
  int segundoValor = -1;
  int tercerValor = -1;
  int cuartoValor = -1;
  int quintoValor = -1;
  List<String> imagenesCards = [
    "https://img.icons8.com/bubbles/2x/jake.png",
    "https://img.icons8.com/bubbles/2x/futurama-bender.png",
    "https://img.icons8.com/bubbles/2x/super-mario.png",
    "https://img.icons8.com/bubbles/2x/iron-man.png",
    "https://img.icons8.com/bubbles/2x/walter-white.png",
    "https://img.icons8.com/bubbles/2x/stormtrooper.png",
    "https://img.icons8.com/bubbles/2x/futurama-mom.png",
    "https://img.icons8.com/bubbles/2x/scream.png",
    "https://img.icons8.com/bubbles/2x/anonymous-mask.png",
    "https://img.icons8.com/bubbles/2x/homer-simpson.png",
    "https://img.icons8.com/bubbles/2x/naruto-sign.png",
    "https://img.icons8.com/bubbles/2x/temple-run.png",
    "https://img.icons8.com/bubbles/2x/ps3.png",
    "https://img.icons8.com/bubbles/2x/chrome.png"
  ];

  void iniciarTimer() {
    tiempo = 0;
    if (timer != null) timer.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        tiempo = timer.tick;
      });
    });
  }

  void verificarTarjetas() {
    bool todosValoresDiferentes = primerValor != segundoValor &&
        primerValor != tercerValor &&
        primerValor != cuartoValor &&
        primerValor != quintoValor &&
        segundoValor != tercerValor &&
        segundoValor != cuartoValor &&
        segundoValor != quintoValor &&
        tercerValor != cuartoValor &&
        tercerValor != quintoValor &&
        cuartoValor != quintoValor;

    bool datosIguales =
        tarjetas[primerValor].dato == tarjetas[segundoValor].dato ||
            tarjetas[primerValor].dato == tarjetas[tercerValor].dato ||
            tarjetas[primerValor].dato == tarjetas[cuartoValor].dato ||
            tarjetas[primerValor].dato == tarjetas[quintoValor].dato ||
            tarjetas[segundoValor].dato == tarjetas[tercerValor].dato ||
            tarjetas[segundoValor].dato == tarjetas[cuartoValor].dato ||
            tarjetas[segundoValor].dato == tarjetas[quintoValor].dato ||
            tarjetas[tercerValor].dato == tarjetas[cuartoValor].dato ||
            tarjetas[tercerValor].dato == tarjetas[quintoValor].dato ||
            tarjetas[cuartoValor].dato == tarjetas[quintoValor].dato;

    if (todosValoresDiferentes &&
        primerValor != -1 &&
        segundoValor != -1 &&
        tercerValor != -1 &&
        cuartoValor != -1 &&
        quintoValor != -1 &&
        !datosIguales) {
      tarjetas[primerValor].puedeVoltearse = false;
      tarjetas[segundoValor].puedeVoltearse = false;
      tarjetas[tercerValor].puedeVoltearse = false;
      tarjetas[cuartoValor].puedeVoltearse = false;
      tarjetas[quintoValor].puedeVoltearse = false;

      // primerValor = -1;
      // segundoValor = -1;
      // tercerValor = -1;
      // cuartoValor = -1;
      // quintoValor = -1;
    } else if ((segundoValor != -1 ||
            tercerValor != -1 ||
            cuartoValor != -1 ||
            quintoValor != -1) &&
        datosIguales) {
      primerValor = -1;
      segundoValor = -1;
      tercerValor = -1;
      cuartoValor = -1;
      quintoValor = -1;
      voltearTarjetas();
    }

    if (tarjetas[primerValor].puedeVoltearse == false &&
            tarjetas[segundoValor].puedeVoltearse == false &&
            tarjetas[tercerValor].puedeVoltearse == false &&
            tarjetas[cuartoValor].puedeVoltearse == false &&
            tarjetas[quintoValor].puedeVoltearse == false
        // tarjetas.every((element) => !element.puedeVoltearse)
        ) {
      Toast.show("Ganamos", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      timer.cancel();
    }
  }

  void refrescarTarjetas() {
    // valores.fillRange(0,cantValores,-1);
    if (cantidadTarjetas % 2 == 0) {
      tarjetas = [
        for (double i = 0; i < cantidadTarjetas; i += 1)
          Tarjeta(imagenesCards[(i / 2).floor() % imagenesCards.length])
      ];
      tarjetas.shuffle();
      primerValor = -1;
      segundoValor = -1;
      tercerValor = -1;
      cuartoValor = -1;
      quintoValor = -1;
      cantMovimientos = 0;
      voltearTarjetas();
      iniciarTimer();
    } else {
      Toast.show("Ingrese un numero de tarjetas par", context);
    }
  }

  void voltearTarjetas() {
    tarjetas.forEach((element) {
      element.voltearTarjeta();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("Memoria Codigo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Cantidad de tarjetas"),
                onChanged: (value) {
                  setState(() {
                    cantidadTarjetas = int.tryParse(value);
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(tiempo.toString()),
                  Text(cantMovimientos.floor().toString()),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: tarjetas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) => FlipCard(
                    flipOnTouch: tarjetas[index].puedeVoltearse,
                    key: tarjetas[index].key,
                    onFlipDone: (isFront) {
                      if (!isFront) {
                        setState(() {
                          if (primerValor == -1) {
                            primerValor = index;
                            print('primer valor = $primerValor');
                          } else if (segundoValor == -1) {
                            segundoValor = index;
                            print('segundo valor = $segundoValor');
                          } else if (tercerValor == -1) {
                            tercerValor = index;
                            print('tercer valor = $tercerValor');
                          } else if (cuartoValor == -1) {
                            cuartoValor = index;
                            print('cuarto valor = $cuartoValor');
                          } else if (quintoValor == -1) {
                            quintoValor = index;
                            print('quinto valor = $quintoValor');
                          }
                          verificarTarjetas();
                          cantMovimientos += 0.5;
                        });
                      }
                    },
                    front: Container(
                        margin: EdgeInsets.all(8), color: Colors.redAccent),
                    back: Container(
                      margin: EdgeInsets.all(8),
                      color: Colors.redAccent.shade100,
                      child: Center(child: Image.network(tarjetas[index].dato)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                refrescarTarjetas();
              });
            }),
      ),
    );
  }
}

class Tarjeta {
  GlobalKey<FlipCardState> key;
  String dato;
  bool puedeVoltearse;

  Tarjeta(String dato) {
    this.dato = dato;
    puedeVoltearse = true;
    key = GlobalKey<FlipCardState>();
  }

  void voltearTarjeta() {
    if (puedeVoltearse &&
        key.currentState != null &&
        !key.currentState.isFront) {
      key.currentState.toggleCard();
    }
  }
}
