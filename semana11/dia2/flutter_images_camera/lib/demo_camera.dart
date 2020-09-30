import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';

import 'main.dart';

class DemoCamara extends StatefulWidget {
  @override
  _DemoCamaraState createState() => _DemoCamaraState();
}

class _DemoCamaraState extends State<DemoCamara> {
  final ImagePicker _picker = ImagePicker();

  VideoPlayerController _controller;
  PickedFile _imageFile;
  PickedFile _videoFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 100,
              child: PhotoView(
                imageProvider: NetworkImage(
                    'https://www.mediaan.com/wp-content/uploads/2019/08/flutter-vs-react-native.jpg'),
              ),
            ),
            _imageFile != null
                ? Image.file(
                    File(_imageFile.path),
                    height: 250,
                  )
                : Container(),
            RaisedButton(
              onPressed: () {
                _displayPickImageDialog(context);
              },
              child: Icon(Icons.camera_alt),
            ),
            _videoFile != null
                ? Container(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatioVideo(_controller),
                    ),
                  )
                : Container(),
            RaisedButton(
              onPressed: () {
                _displayPickVideoDialog(context);
              },
              child: Icon(Icons.videocam),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _displayPickImageDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('seleccione'),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('CAMARA'),
                onPressed: () async {
                  // final pickedFile = await _picker.getVideo(
                  final pickedFile = await _picker.getImage(
                    source: ImageSource.camera,
                  );
                  setState(() {
                    _imageFile = pickedFile;
                  });
                },
              ),
              FlatButton(
                child: const Text('GALERIA'),
                onPressed: () async {
                  final pickedFile = await _picker.getImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    _imageFile = pickedFile;
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayPickVideoDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('seleccione'),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('CAMARA'),
                onPressed: () async {
                  final pickedFile = await _picker.getVideo(
                      source: ImageSource.camera,
                      maxDuration: const Duration(seconds: 10));
                  await _playVideo(pickedFile);
                  // final pickedFile = await _picker.getVideo(
                  //   // final pickedFile = await _picker.getImage(
                  //   source: ImageSource.camera,
                  // );
                  setState(() {
                    _videoFile = pickedFile;
                  });
                },
              ),
              // FlatButton(
              //   child: const Text('GALERIA'),
              //   onPressed: () async {
              //     final pickedFile = await _picker.getImage(
              //       source: ImageSource.gallery,
              //     );
              //     setState(() {
              //       _imageFile = pickedFile;
              //     });
              //   },
              // ),
            ],
          );
        });
  }

  Future<void> _playVideo(PickedFile file) async {
    if (file != null && mounted) {
      _controller = VideoPlayerController.file(File(file.path));
      await _controller.setVolume(1.0);

      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      setState(() {});
    }
  }
}
