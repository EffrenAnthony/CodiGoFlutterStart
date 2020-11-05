import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reconocimiento_imagenes/barcode.dart';
import 'package:reconocimiento_imagenes/barcode_reader.dart';
import 'package:reconocimiento_imagenes/detalle.dart';
import 'package:reconocimiento_imagenes/image_labeler.dart';
import 'package:reconocimiento_imagenes/text_recognizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reconocedor de imagener'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Seleccionar una imagen'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () async {
                  var pickedFile =
                      await picker.getImage(source: ImageSource.camera);
                  File file = File(pickedFile.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeReader(file),
                      ));
                },
                child: Text('Canara'),
              ),
              RaisedButton(
                onPressed: () async {
                  var pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  File file = File(pickedFile.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeReader(file),
                      ));
                },
                child: Text('Galleria'),
              )
            ],
          )
        ],
      ),
    );
  }
}
