import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BarcodeReader2 extends StatefulWidget {
  File file;
  BarcodeReader2(this.file);

  @override
  _BarcodeReader2State createState() => _BarcodeReader2State();
}

class _BarcodeReader2State extends State<BarcodeReader2> {
  String result;
  Future decode() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(widget.file);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List barCodes = await barcodeDetector.detectInImage(ourImage);

    for (Barcode readableCode in barCodes) {
      print(readableCode.boundingBox);
      print(readableCode.cornerPoints);
      print(readableCode.rawValue);
      final BarcodeValueType valueType = readableCode.valueType;
      switch (valueType) {
        case BarcodeValueType.wifi:
          String ssid = readableCode.wifi.ssid;
          print(ssid);
          String password = readableCode.wifi.password;
          print(password);
          BarcodeWiFiEncryptionType type = readableCode.wifi.encryptionType;
          print(type);
          break;
        case BarcodeValueType.url:
          String title = readableCode.url.title;
          print(title);
          String url = readableCode.url.url;
          print(url);
          break;
        case BarcodeValueType.product:
          String title = readableCode.displayValue;
          print(title);
          break;
        case BarcodeValueType.sms:
          String title = readableCode.displayValue;
          print(title);
          break;
        case BarcodeValueType.text:
          String title = readableCode.displayValue;
          print(title + ' este es ');
          break;
      }
      setState(() {
        result = valueType.toString();
      });
    }
  }

  @override
  void initState() {
    decode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barcode scanner'),
        ),
        body: Column(
          children: [
            Expanded(child: Image.file(widget.file)),
            Expanded(
                child: Row(
              children: [
                Text('DATA: '),
                Text((result != null ? result : 'no trajo nada'))
              ],
            )),
          ],
        ));
  }
}
