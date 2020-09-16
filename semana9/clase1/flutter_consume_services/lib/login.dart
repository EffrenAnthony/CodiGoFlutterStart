import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool estaCargando = false;
  String tokenUsuario = '';

  Future<String> crearUsuario() async {
    setState(() {
      estaCargando = true;
    });
    // var response = await http.post('https://viveyupi.com/api/api-token-auth/',
    var response = await http.post('https://viveyupi.com/api/api-token-auth/',
        body: {'username': usuario.text, 'password': trabajo.text});
    print(response.statusCode);
    print(response.body.toString());
    setState(() {
      estaCargando = false;
    });
    var respJson = jsonDecode(response.body);
    tokenUsuario = respJson['token'];
    return tokenUsuario;

    // print(response.body);
  }

  Future<String> consultarUsuario() async {
    setState(() {
      estaCargando = true;
    });
    // var response = await http.post('https://viveyupi.com/api/api-token-auth/',
    var response =
        await http.post('https://viveyupi.com/api/usuario/', headers: {
      'Authorization': 'JWT ' + tokenUsuario,
    });
    setState(() {
      estaCargando = false;
    });
    print(response.body);
    return response.body;

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
              ),
              RaisedButton(
                child: Text('Consultar'),
                onPressed: () async {
                  String usr = await consultarUsuario();
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
