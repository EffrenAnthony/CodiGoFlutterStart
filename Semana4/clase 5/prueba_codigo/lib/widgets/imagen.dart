import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageButtonPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        color: Colors.redAccent,
        child: Column(
          children: [
            Icon(
              FontAwesomeIcons.adobe,
              size: 100,
              color: Colors.blueAccent,
            ),
            Image.network(
              'https://images.pexels.com/photos/803940/pexels-photo-803940.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 100,
            ),
            FlatButton(
              child: Text('flat'),
              highlightColor: Colors.blue,
              onPressed: () => {},
            ),
            RaisedButton(
              child: Text('text'),
              onPressed: () => {},
              highlightColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
            ),
            OutlineButton(
              onPressed: () => {},
              child: Text('holi'),
            ),
            CupertinoButton(
              child: Text('cupertino'),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.apple),
              tooltip: 'IcoonButton',
              onPressed: () => {},
            ),
            RaisedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.airplanemode_active),
              label: Text('Raised Icon'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
