import 'package:flutter/material.dart';

class AnimatedCrossFaceWidget extends StatefulWidget {
  AnimatedCrossFaceWidget({Key key}) : super(key: key);

  @override
  _AnimatedCrossFaceWidgetState createState() =>
      _AnimatedCrossFaceWidgetState();
}

class _AnimatedCrossFaceWidgetState extends State<AnimatedCrossFaceWidget> {
  bool _first = true;

  _crossFade() {
    setState(() {
      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RaisedButton(onPressed: () {
          _crossFade();
        }),
        AnimatedCrossFade(
          firstChild: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          secondChild: Text('me animaron'),
          crossFadeState:
              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        )
      ],
    );
  }
}
