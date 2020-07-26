void main() {
  int cantHamburguesa = 2;
  double costoHamburguesa;
  String tipoHamburguesa = 'Simple';
  String metodoPago = 'Tarjeta';
  double costoTotal;

  if (tipoHamburguesa == 'Simple') {
    costoHamburguesa = 20;
  } else if (tipoHamburguesa == 'Doble') {
    costoHamburguesa = 25;
  } else if (tipoHamburguesa == 'Triple') {
    costoHamburguesa = 28;
  }

  if (metodoPago == 'Tarjeta') {
    costoTotal = costoHamburguesa * 1.05 * cantHamburguesa;
  } else {
    costoTotal = costoHamburguesa * cantHamburguesa;
  }

  print('Costo total: ${costoTotal}');
}
