import 'dart:math';

void main() {
  int canalA = 2;
  int canalB = 30;

  int cantidadCambios = 0;

  if (canalA < canalB && canalB > 50) {
    cantidadCambios = 99 - canalB + canalA;
  } else if (canalA < canalB && canalB < 50) {
    cantidadCambios = canalB - canalA;
  } else if (canalB < canalA && canalA > 50) {
    cantidadCambios = 99 - canalA + canalB;
  } else if (canalA < canalB && canalB < 50) {
    cantidadCambios = canalA - canalB;
  } else {
    cantidadCambios = (canalA - canalB).abs();
  }

  print(cantidadCambios);
}
