import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final MaterialColor color;
  final Widget child;

  const GradientContainer({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color[800], color[300]],
        ),
      ),
      child: child,
    );
  }
}
