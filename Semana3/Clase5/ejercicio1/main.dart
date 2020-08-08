import 'dart:io';

import 'vendedor.dart';

void main(List<String> args) {
  List<Vendeor> vendedores = [];
  while (true) {
    print('Seleccione: ');
    print('1 para ingresar usuario');
    print('2 para salir');
    print('-' * 50);
    String opcion = stdin.readLineSync();
    switch (opcion) {
      case '1':
        print('Ingrese su nombre');
        String nombre = stdin.readLineSync();
        Vendeor nuevoVendedor = new Vendeor(nombre);
        for (var i = 0; i < 12; i++) {
          print('Ingrese el monto de venta para el mes ${i + 1}');
          double monto = double.parse(stdin.readLineSync());
          nuevoVendedor.registrarVenta(monto);
        }
        vendedores.add(nuevoVendedor);
        print('sape');
        break;
      case '2':
        print('salir');
        return;
      default:
    }
    print('-' * 50);
    vendedores.forEach((print));
    print('-' * 50);
  }
}
