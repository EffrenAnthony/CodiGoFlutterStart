import 'package:codigo_chat/services/auth.dart';
import 'package:codigo_chat/services/database.dart';
import 'package:codigo_chat/utils/authenticate.dart';
import 'package:codigo_chat/utils/preferencias.dart';
import 'package:codigo_chat/views/chats.dart';
import 'package:codigo_chat/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool logeado = false;

  estaLogeado() async {
    Preferencias().getLogInState().then((value) {
      if (value != null && value) {
        setState(() {
          logeado = value;
        });
      }
    });
  }

  @override
  void initState() {
    estaLogeado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: logeado ? Chats() : Authenticate(),
    );
  }
}
