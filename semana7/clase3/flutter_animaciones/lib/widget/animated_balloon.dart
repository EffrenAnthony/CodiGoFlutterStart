import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  AnimatedBalloonWidget({Key key}) : super(key: key);

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  // ?El ticket provider sabe en que cuadro estamos y puede ejecutar nuestra animación en el momento correcto
  AnimationController _copntrollerFloatUp;
  AnimationController _copntrollerGrowSize;

  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    _copntrollerFloatUp =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _copntrollerGrowSize =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

    super.initState();
  }

  // ? Dispose se llama cuando se limpia el widget el ello indicamos que los controller ya no funcionen
  @override
  void dispose() {
    _copntrollerFloatUp.dispose();
    _copntrollerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.height / 3;
    double _balloonLocation =
        MediaQuery.of(context).size.height - _balloonHeight;
    // ?Tween va a interpolar entre ambas ubicaciones
    _animationFloatUp = Tween(begin: _balloonLocation, end: 0.0).animate(
        CurvedAnimation(parent: _copntrollerFloatUp, curve: Curves.bounceIn));
    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
        CurvedAnimation(parent: _copntrollerGrowSize, curve: Curves.bounceIn));

    _copntrollerFloatUp.forward();
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          width: _animationGrowSize.value,
          margin: EdgeInsets.only(top: _animationFloatUp.value),
          child: GestureDetector(
            onTap: () {
              if (_copntrollerFloatUp.isCompleted) {
                _copntrollerFloatUp.reverse();
                _copntrollerGrowSize.reverse();
              } else {
                _copntrollerFloatUp.forward();
                _copntrollerGrowSize.forward();
              }
            },
            child: Image.network(
              'https://img.icons8.com/officel/2x/hot-air-balloon.png',
              height: _balloonHeight,
              width: _balloonWidth,
            ),
          ),
        );
      },
    );
  }
}
