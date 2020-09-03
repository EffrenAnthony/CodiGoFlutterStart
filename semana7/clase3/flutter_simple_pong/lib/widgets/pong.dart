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

  double width = 0;
  double height = 0;
  double posX = 0;
  double posY = 0;
  double batWitdth = 0;
  double batHeight = 0;
  double batPosition = 0;

  @override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: 1),
    );
    animation = Tween(begin: 0.0, end: 100.0).animate(controller);
    animation.addListener(() {
      setState(() {
        posX += movX;
        posY += movY;
      });
      checkBorders();
    });
    //
    controller.forward();
    super.initState();
  }

  void checkBorders() {
    if (posX >= width - (50)) {
      movX = -1;
    }
    if (posY >= height - (50)) {
      movY = -1;
    }
    if (posX <= 0) {
      movX = 1;
    }
    if (posY <= 0) {
      //TODO si la barra esta en la misma posicion debe hacer que la pelota rebote en la barra y seguir su animación
      movY = 1;
    }
    // TODO sino , perder
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        batWitdth = width / 5;
        batHeight = height / 20;
        return Stack(
          children: [
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
                  child: Bat(batHeight, batWitdth),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
