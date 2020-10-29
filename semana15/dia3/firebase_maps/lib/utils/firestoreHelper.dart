import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_maps/models/place.dart';

class FirestoreHelper {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addPlace(Place place) {
    var resultado = _firestore
        .collection("markers")
        .add(place.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));

    return resultado;
  }

  Future<List<Place>> getPlaces() async {
    List<Place> places = [];
    var collection = await _firestore.collection("markers").get();
    if (collection != null) {
      places = collection.docs.map((e) => Place.fromMap(e)).toList();
    }
    return places;
  }
}
