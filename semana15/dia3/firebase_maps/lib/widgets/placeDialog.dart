import 'package:firebase_maps/models/place.dart';
import 'package:firebase_maps/utils/firestoreHelper.dart';
import 'package:flutter/material.dart';

class PlaceDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLat = TextEditingController();
  TextEditingController txtLog = TextEditingController();

  FirestoreHelper _firestore = FirestoreHelper();

  bool isNew;
  Place place;

  PlaceDialog(this.place, this.isNew);

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
            //     : Container(),
            // IconButton(
            //   icon: Icon(Icons.camera),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CameraScreen(place),
            //       ),
            //     );
            //   },
            // ),
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
