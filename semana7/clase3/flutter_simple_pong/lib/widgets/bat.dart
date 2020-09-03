import 'package:flutter/material.dart';

class Bat extends StatelessWidget {
  double width;
  double heigth;
  Bat(this.heigth, this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      color: Colors.grey,
    );
  }
}
