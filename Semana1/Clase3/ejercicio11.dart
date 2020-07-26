void main() {
  int cantidadPersonas = 7;
  double pago;

  if (cantidadPersonas < 8) {
    pago = cantidadPersonas * 1.5;
  } else if (cantidadPersonas >= 8) {
    pago = cantidadPersonas * 0.5;
  }

  print('Son ${cantidadPersonas} y el pago es ${pago} soles');
}
