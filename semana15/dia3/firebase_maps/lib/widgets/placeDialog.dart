import 'dart:io';

import 'package:firebase_maps/models/place.dart';
import 'package:firebase_maps/utils/firestoreHelper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class PlaceDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLat = TextEditingController();
  TextEditingController txtLog = TextEditingController();
  ImagePicker picker = ImagePicker();

  FirestoreHelper _firestore = FirestoreHelper();

  bool isNew;
  Place place;

  PlaceDialog(this.place, this.isNew);
  Future pickImage() async {
    var pickedImage = await picker.getImage(
      source: ImageSource.camera,
    );
    print(pickedImage.path);
    // uploadImageToFirebase(pickedImage.path);
  }

  Future uploadImageToFirebase(String imagePath) async {
    String fileName = basename(imagePath);
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child('lugar/$fileName');
    StorageUploadTask uploadTask = storageRef.putFile(File(imagePath));
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    snapshot.ref.getDownloadURL().then((value) => print(value));
  }

  Widget buildAlert(BuildContext context) {
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
            // (place.image != '')
            //     ? Container(
            //         child: Image.file(File(place.image)),
            //       )
            //     :
            //     Container(),
            Container(),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                pickImage();
              },
            ),
            RaisedButton(
                child: Text("Ok"),
                onPressed: () async {
                  place.name = txtName.text;
                  place.lat = double.parse(txtLat.text);
                  place.lon = double.parse(txtLog.text);
                  await _firestore.addPlace(place);
                  // helper.insertPlace(place);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
