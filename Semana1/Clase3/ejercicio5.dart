void main() {
  double promedio = 22;
  if (promedio <= 0 || promedio > 20) {
    print('valor no válido');
  } else if (promedio < 6) {
    print('Repite');
  } else if (promedio < 11) {
    print('Desaprobado');
  } else if (promedio < 13) {
    print('Aprobado');
  } else if (promedio < 15) {
    print('Regular');
  } else if (promedio < 17) {
    print('Bueno');
  } else if (promedio < 19) {
    print('Destacado');
  } else {
    print('Excelente');
  }
}
