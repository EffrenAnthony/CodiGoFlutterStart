import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_pong/widgets/ball.dart';
import 'package:flutter_simple_pong/widgets/bat.dart';

class Pong extends StatefulWidget {
  Pong({Key key}) : super(key: key);

  @override
  _PongState createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  int movX = 1;
  int movY = 1;

  double randX = 0;
  double randY = 0;

  double width = 0;
  double height = 0;
  double posX = 0;
  double posY = 0;
  double batWidth = 0;
  double batHeight = 0;
  double batPosition = 0;
  int score = 0;
  int live = 3;

  @override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: 1),
    );
    animation = Tween(begin: 0.0, end: 100.0).animate(controller);
    // ? El init state solo ocurre una vez, pero con el lisener permite que cambie la pantalla cada vez que se haga un setState
    animation.addListener(() {
      setState(() {
        posX += movX * 5 * randX;
        posY += movY * 5 * randY;
      });
      checkBorders();
    });
    controller.forward();
    super.initState();
  }

  void checkBorders() {
    if (posX >= width - 50) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
        randY = (Random().nextInt(10) + 1) / 10;
      });
      movX = -1;
    }

    // Llegando abajo
    if (posY >= height - 50 - batHeight - 50) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
        randY = (Random().nextInt(10) + 1) / 10;
      });

      movY = -1;
      if (batPosition <= posX && batPosition + batWidth >= posX) {
        setState(() {
          score++;
        });
      } else {
        live--;
        if (live <= 0) {
          controller.stop();
          showLoseDialog();
        }
      }
    }
    // Llegando al lado derecho
    if (posX <= 0) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
        randY = (Random().nextInt(10) + 1) / 10;
      });
      movX = 1;
    }
    // Llegando arriba
    if (posY <= 0) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
        randY = (Random().nextInt(10) + 1) / 10;
      });
      movY = 1;
    }
  }

  showLoseDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pediste'),
          actions: [
            FlatButton(
                onPressed: () {
                  setState(() {
                    score = 0;
                    live = 3;
                  });
                  controller.forward();
                  Navigator.pop(context);
                },
                child: Text('Reiniciar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        batWidth = width / 5;
        batHeight = height / 20;
        return Stack(
          children: [
            Positioned(
              child: Text('Vida: $live'),
              top: 10,
              left: 10,
            ),
            Positioned(
              child: Text('Score: $score'),
              top: 10,
              right: 10,
            ),
            Positioned(
              top: posY,
              left: posX,
              child: Ball(),
            ),
            Positioned(
              bottom: 0,
              left: batPosition,
              child: GestureDetector(
                onHorizontalDragUpdate: (update) {
                  setState(() {
                    batPosition += update.delta.dx;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 50),
                  child: Bat(batHeight, batWidth),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
