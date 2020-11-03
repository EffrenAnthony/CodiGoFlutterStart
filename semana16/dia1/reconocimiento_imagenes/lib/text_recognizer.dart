import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class ReconocedorText extends StatefulWidget {
  File file;
  ReconocedorText(this.file);

  @override
  _ReconocedorTextState createState() => _ReconocedorTextState();
}

class _ReconocedorTextState extends State<ReconocedorText> {
  VisionText text;
  void reconocerTexto() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    TextRecognizer imageLabeler = FirebaseVision.instance.textRecognizer();
    VisionText detectedText = await imageLabeler.processImage(visionImage);
    print(detectedText);
    setState(() {
      text = detectedText;
    });
  }

  @override
  void initState() {
    reconocerTexto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reconocedor de texto'),
      ),
      body: Column(
        children: [
          Expanded(child: Image.file(widget.file)),
          Expanded(
              child: (text == null)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: text.blocks.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(text.blocks[index].text),
                      ),
                    ))
        ],
      ),
    );
  }
}
