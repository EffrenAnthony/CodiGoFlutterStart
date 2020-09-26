import 'package:flutter/material.dart';
import 'package:miloficios_app/utils/sesion_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String token = "";

  fetchUserData() async {
    this.token = token;
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    if (token == null) {
      token = '';
    }
    notifyListeners();
  }

  saveUserData(String token) async {
    this.token = token;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    print(token);
    notifyListeners();
  }
}
