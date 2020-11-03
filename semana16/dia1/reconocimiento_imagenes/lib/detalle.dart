import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetalleReconocimientoImagenes extends StatefulWidget {
  File file;
  DetalleReconocimientoImagenes(this.file);

  @override
  _DetalleReconocimientoImagenesState createState() =>
      _DetalleReconocimientoImagenesState();
}

class _DetalleReconocimientoImagenesState
    extends State<DetalleReconocimientoImagenes> {
  ui.Image image;
  List<Face> faces;

  void detectFaces() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
        FaceDetectorOptions(
            mode: FaceDetectorMode.accurate,
            enableLandmarks: true,
            enableClassification: true));
    List<Face> detectedFaces = await faceDetector.processImage(visionImage);
    for (Face f in detectedFaces) {
      print(f);
      print('Sonrien? :' + f.smilingProbability.toString());
    }
    faces = detectedFaces;
    var data = await widget.file.readAsBytes();
    decodeImageFromList(data).then((value) {
      setState(() {
        image = value;
      });
    });
  }

  @override
  void initState() {
    detectFaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // detectFaces();
    return Scaffold(
      appBar: AppBar(
        title: Text('Reconocimiento de imagenes'),
      ),
      body: (image == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: FittedBox(
                child: SizedBox(
                  height: image.height.toDouble(),
                  width: image.width.toDouble(),
                  child: CustomPaint(
                    painter: FacePainter(image, faces),
                  ),
                ),
              ),
            ),
    );
  }
}

class FacePainter extends CustomPainter {
  ui.Image image;
  List<Face> faces;
  List<Rect> rect = [];

  FacePainter(ui.Image img, List<Face> faces) {
    this.image = img;
    this.faces = faces;
    for (Face f in faces) {
      rect.add(f.boundingBox);
    }
  }
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;
    paint.color = Colors.red;

    canvas.drawImage(image, Offset.zero, Paint());
    for (Rect r in rect) {
      canvas.drawRect(r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
