import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/views/listar_categorias.dart';

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
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Categorias(),
    );
  }
}
