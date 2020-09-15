import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AutenticationUser extends StatefulWidget {
  @override
  _AutenticationUserState createState() => _AutenticationUserState();
}

class _AutenticationUserState extends State<AutenticationUser> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool estaCargando = false;

  Future<String> crearUsuario() async {
    setState(() {
      estaCargando = true;
    });
    // ? Register devuelve un token, es un post (Provar con "email": "eve.holt@reqres.in" , "password": "pistol")
    // var response = await http.post('https://reqres.in/api/register',
    // ? Login devuelve tambien un token y su metodo tambien es un post
    var response = await http.post('https://reqres.in/api/login',
        body: {'email': usuario.text, 'password': trabajo.text});
    print(response.statusCode);
    print(response.body.toString());
    setState(() {
      estaCargando = false;
    });
    return response.body.toString();

    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: estaCargando,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usuario,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: trabajo,
                decoration: InputDecoration(
                  hintText: 'Trabajo',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Login or Register'),
                onPressed: () async {
                  String usr = await crearUsuario();
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(usr),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
