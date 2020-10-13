import 'package:demofirebase/routes/events_routes.dart';
import 'package:demofirebase/utils/authentication.dart';
import 'package:flutter/material.dart';

class SignUpRoute extends StatefulWidget {
  SignUpRoute({Key key}) : super(key: key);

  @override
  _SignUpRouteState createState() => _SignUpRouteState();
}

class _SignUpRouteState extends State<SignUpRoute> {
  Authentication auth;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPwd = TextEditingController();
  bool isLogin = true;

  Future signUp() async {
    auth = Authentication();
    String userId = "";
    if (isLogin) {
      userId = await auth.logIn(txtEmail.text, txtPwd.text);
    } else {
      userId = await auth.signUp(txtEmail.text, txtPwd.text);
    }

    if (userId.length > 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EventsRoute(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Column(
        children: [
          TextField(
            controller: txtEmail,
            decoration:
                InputDecoration(hintText: 'Correo', icon: Icon(Icons.mail)),
          ),
          TextField(
            controller: txtPwd,
            obscureText: true,
            decoration:
                InputDecoration(hintText: 'Password', icon: Icon(Icons.lock)),
          ),
          RaisedButton(
            onPressed: () {
              signUp();
            },
            child: Text(isLogin ? 'Ingresar' : 'Registrate'),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(!isLogin ? 'Ingresar' : 'Registrate'))
        ],
      ),
    );
  }
}
