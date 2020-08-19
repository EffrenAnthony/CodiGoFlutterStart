import 'package:flutter/material.dart';

class CardPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Card(
                elevation: 5,
                color: Colors.red,
                shadowColor: Colors.blue,
                child: Container(
                  width: 100,
                  child: Text("Codigo"),
                ),
              ),
              Text("hola codigo"),
              Container(
                width: 100,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
