import 'package:flutter/material.dart';

class BotonContador extends StatefulWidget {
  @override
  _BotonContadorState createState() => _BotonContadorState();
}

class _BotonContadorState extends State<BotonContador> {
  int contador = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    //CounterProvider cProvider = Provider.of<CounterProvider>(context);
    return RaisedButton(
      onPressed: () {
        setState(() {
          contador++;
        });
        print(contador);
      },
    );
  }
}
