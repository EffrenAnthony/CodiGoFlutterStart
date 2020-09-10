import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/providers/couter_provider.dart';
import 'package:flutter_demo_provider/widgets/boton_contador_widget.dart';
import 'package:provider/provider.dart';

class ContadorWidget extends StatefulWidget {
  @override
  _ContadorWidgetState createState() => _ContadorWidgetState();
}

class _ContadorWidgetState extends State<ContadorWidget> {
  @override
  Widget build(BuildContext context) {
    print("Redibuja Contador");
    // CounterProvider cProvider = Provider.of<CounterProvider>(context);
    return Text("");
  }
}
