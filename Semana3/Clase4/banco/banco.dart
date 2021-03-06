import 'cuenta.dart';

class Banco {
  List<Cuenta> cuentas = new List();

  void agregarCuenta(Cuenta c) {
    cuentas.add(c);
  }

  void imprimirClientes() {
    cuentas.forEach(
        (cuenta) => {print('${cuenta.numeroCuenta} ${cuenta.nombreTitular}')});
  }

  void transferencia(String origen, String destino, double monto) {
    Cuenta ori = buscarCuentaPorNumero(origen);
    Cuenta dest = buscarCuentaPorNumero(destino);
    if (ori != null && dest != null) {
      if (ori.saldo < monto) {
        print("Transferencia no realizada");
      } else {
        ori.Retirar(monto);
        dest.Depositar(monto);
      }
    } else {
      print('Los datos ingresados son incorrectos');
    }
  }

  Cuenta buscarCuentaPorNumero(String g) {
    for (var i = 0; i < cuentas.length; i++) {
      if (cuentas[i].numeroCuenta == g) return cuentas[i];
    }
  }
}
