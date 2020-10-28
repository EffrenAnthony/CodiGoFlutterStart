import 'dart:io';

import 'package:demo_google_maps/camera_screen.dart';
import 'package:demo_google_maps/dbHelper.dart';
import 'package:demo_google_maps/place.dart';
import 'package:flutter/material.dart';

class PlaceDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLat = TextEditingController();
  TextEditingController txtLog = TextEditingController();

  bool isNew;
  Place place;

  PlaceDialog(this.place, this.isNew);

  Widget buildAlert(BuildContext context) {
    DbHelper helper = DbHelper();
    txtName.text = place.name;
    txtLat.text = place.lat.toString();
    txtLog.text = place.lon.toString();
    return AlertDialog(
      title: Text("Place"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(hintText: 'Nombre'),
            ),
            TextField(
              controller: txtLat,
              decoration: InputDecoration(hintText: 'Lat'),
            ),
            TextField(
              controller: txtLog,
              decoration: InputDecoration(hintText: 'Lon'),
            ),
            (place.image != '')
                ? Container(
                    child: Image.file(File(place.image)),
                  )
                : Container(),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(place),
                  ),
                );
              },
            ),
            RaisedButton(
                child: Text("Ok"),
                onPressed: () {
                  place.name = txtName.text;
                  place.lat = double.parse(txtLat.text);
                  place.lon = double.parse(txtLog.text);
                  helper.insertPlace(place);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
