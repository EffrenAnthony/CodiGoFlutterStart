import 'dart:math';

void main(List<String> args) {
  int n = 8;
  int contador = 0;
  for (int i = 0; i < n; i++) {
    if ((pow(2, i) - 1) % 7 == 0) {
      contador++;
    }
  }
  print(contador);
}
