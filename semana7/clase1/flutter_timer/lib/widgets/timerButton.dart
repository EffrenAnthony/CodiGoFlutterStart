import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  // ? se pone final porque son variables inmutables
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  TimerButton(
      {@required this.color,
      @required this.text,
      @required this.size,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: this.color,
      minWidth: this.size,
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
