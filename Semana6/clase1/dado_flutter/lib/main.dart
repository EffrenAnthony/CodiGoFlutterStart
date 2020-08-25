import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaDado(),
    );
  }
}

class PaginaDado extends StatefulWidget {
  @override
  _PaginaDadoState createState() => _PaginaDadoState();
}

class _PaginaDadoState extends State<PaginaDado> {
  List<int> _numerosDados = [1];
  int _cantidadDados = 1;
  int _numeroDado = 1;

  void _refrescarDados() {
    for (int i = 0; i < _numerosDados.length; i++) {
      _numerosDados[i] = 1 + Random().nextInt(6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Dado'),
      ),
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          _cantidadDados++;
                          _numerosDados.add(1);
                          _refrescarDados();
                        });
                      },
                      label: Text(
                        'Agregar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      ),
                      color: Colors.deepPurpleAccent,
                      onPressed: () {
                        setState(() {
                          if (_numerosDados.length <= 1) {
                            return;
                          } else {
                            _cantidadDados--;
                            _numerosDados.removeLast();
                            _refrescarDados();
                          }
                        });
                      },
                      label: Text(
                        'Quitar',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () => {
                          setState(() {
                            // El for each no funciona porque lo que hace es actualizar variables copia
                            // _numerosDados.forEach((element) {
                            //   element = 1 + Random().nextInt(6);
                            // });
                            for (var i = 0; i < _numerosDados.length; i++) {
                              _numeroDado = 1 + Random().nextInt(6);
                              _numerosDados[i] = _numeroDado;
                            }
                          }),
                        },
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5),
                      itemCount: _cantidadDados,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 100,
                          image: AssetImage(
                              'assets/images/dice${_numerosDados[index]}.png'),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
