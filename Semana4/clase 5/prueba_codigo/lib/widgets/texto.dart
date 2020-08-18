import 'package:flutter/material.dart';

class TextoPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueAccent,
        // rich text es para tener varios textos y cambiralos como queremos
        child: RichText(
          text: TextSpan(
            text: 'Padre',
            style: TextStyle(fontSize: 20),
            children: [
              TextSpan(
                text: ' hijo 1',
                style: TextStyle(
                  backgroundColor: Colors.greenAccent,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 3,
                  wordSpacing: 10,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.amber,
                ),
              ),
              TextSpan(
                text: ' hijo 2',
                style: TextStyle(
                  backgroundColor: Colors.red,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3,
                  wordSpacing: 10,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
