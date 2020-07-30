import 'dart:math';

void main() {
  int n = 4;

  int cantidadCubitosVisibles =
      n * n + (n * (n - 1)) * 2 + n * (n - 2) + (pow(n - 2, 2) * 2);

  print(cantidadCubitosVisibles);
}
