import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  int getCounter() => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    // Notify listener notifica a todos los widgets que contengan al provider
    notifyListeners();
  }
}
