import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserInfo(Map user) async {
    _firestore.collection("users").add(user).catchError((e) {
      print(e.toString());
    });
  }

  Future searchByName(String searchField) {
    return _firestore
        .collection('users')
        .where('userName', isEqualTo: searchField)
        .get();
  }
}