import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UpdateUser extends StatefulWidget {
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool estaCargando = false;

  Future<String> crearUsuario() async {
    setState(() {
      estaCargando = true;
    });
    // ? Put actualiza todo el objeto
    // var response = await http.put('https://reqres.in/api/users/2',
    // ? Patch actualiza solo los datos cambiados
    var response = await http.patch('https://reqres.in/api/users/2',
        body: {'name': usuario.text, 'job': trabajo.text});
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
                child: Text('Actualziar'),
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
