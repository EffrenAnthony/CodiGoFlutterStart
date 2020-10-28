import 'dart:io';

import 'package:demo_google_maps/dbHelper.dart';
import 'package:demo_google_maps/main.dart';
import 'package:demo_google_maps/place.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  Place place;
  final String imagePath;

  ImagePreview(this.imagePath, this.place);

  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                place.image = imagePath;
                helper.insertPlace((place));
                Navigator.popUntil(context, (route) => route.isFirst);
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Image.file(File(imagePath)),
        ),
      ),
    );
  }
}
