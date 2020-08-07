import 'dart:io';

import 'banco.dart';
import 'cuenta.dart';

Banco cajaCodigo;
void main() {
  cajaCodigo = new Banco();
  while (true) {
    print('------ Bienvenido a nuestro Banco -------');
    print('Digite: ');
    print('1 para ingresar a su cuenta');
    print('2 para crear una nueva cuenta');
    print('3 para Salir');
    String opcion = stdin.readLineSync();
    if (opcion == '1') {
      consultarCuenta();
    } else if (opcion == '2') {
      crearNuevaCuenta();
    } else if (opcion == '3') {
      print('Cerrando el programa');
      return;
    }
  }
}

void consultarCuenta() {
  print('-' * 50);
  print('Ver cuenta');
  print('Ingrese Numero de Cuenta');
  String numeroCuenta = stdin.readLineSync();
  Cuenta c = cajaCodigo.buscarCuentaPorNumero(numeroCuenta);
  if (c != null) {
    print('-' * 50);
    print('Cuenta de: ${c}');
    print('-' * 50);
    while (true) {
      print('Digite: ');
      print('1 para depositar');
      print('2 para retirar');
      print('3 para transferir');
      print('4 para Salir');
      String opcion = stdin.readLineSync();
      print('-' * 50);
      if (opcion == '1') {
        print('Ingrese el momnto a depositar');
        String saldo = stdin.readLineSync();
        print('-' * 50);
        c.Depositar(double.parse(saldo));
        print('-' * 50);
      } else if (opcion == '2') {
        print('Ingrese el momnto a retirar');
        String monto = stdin.readLineSync();
        print('-' * 50);
        c.Retirar(double.parse(monto));
        print('-' * 50);
      } else if (opcion == '3') {
        print('Ingrese el momnto a transferir');
        String monto = stdin.readLineSync();
        print('Ingrese la cuenta destino');
        String destino = stdin.readLineSync();
        print('-' * 50);
        cajaCodigo.transferencia(c.numeroCuenta, destino, double.parse(monto));
        print('-' * 50);
      } else if (opcion == '4') {
        print('Saliendo de la cuenta');
        return;
      }
    }
  }
  print(c);
}

void crearNuevaCuenta() {
  print('-' * 50);
  print('Nueva Cuenta');
  print('Ingrese Nombre');
  String nombre = stdin.readLineSync();
  print('Ingrese Numero de Cuenta');
  String numeroCuenta = stdin.readLineSync();
  print('Ingrese Saldo');
  String saldo = stdin.readLineSync();
  print('-' * 50);
  Cuenta c = new Cuenta(
      nombreTitular: nombre,
      numeroCuenta: numeroCuenta,
      saldo: double.parse(saldo));
  cajaCodigo.agregarCuenta(c);
  print('Cuenta creada exitosamente');
  print('-' * 50 + '\n');
}

// Cuenta solesAnthony = Cuenta(
//     nombreTitular: "Anthony",
//     tipo: "Corriente",
//     tipoMoneda: 1,
//     numeroCuenta: "123-123",
//     saldo: 17000);
// Cuenta solesLufa = Cuenta(
//     nombreTitular: "Lufa",
//     tipo: "Corriente",
//     tipoMoneda: 1,
//     numeroCuenta: "123-125",
//     saldo: 15000);
// // solesAnthony.Depositar(100);
// // solesAnthony.Retirar(15);
// // solesAnthony.Retirar(5);
// // solesAnthony.Depositar(10);
// // print("");
// // solesAnthony.imprimirMovimientos();
// // print(solesAnthony);

// Banco cajaCodigo = new Banco();

// cajaCodigo.agregarCuenta(solesAnthony);
// cajaCodigo.agregarCuenta(solesLufa);
// cajaCodigo.imprimirClientes();
// cajaCodigo.transferencia('123-125', '123-123', 10000);
// print(solesAnthony);
// print(solesLufa);
