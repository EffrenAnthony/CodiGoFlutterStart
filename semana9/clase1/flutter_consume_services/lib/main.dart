import 'package:flutter/material.dart';
import 'package:flutter_consume_services/create_user.dart';
import 'package:flutter_consume_services/get_user.dart';
import 'package:flutter_consume_services/list_users.dart';
import 'package:flutter_consume_services/register_login_user.dart';
import 'package:flutter_consume_services/update_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AutenticationUser(),
    );
  }
}
