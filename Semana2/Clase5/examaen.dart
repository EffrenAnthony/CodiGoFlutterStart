import 'dart:math';

void main(List<String> args) {
  print(intermedio(-10, 5));
  print(buscarNumero(1555555555542345457, '5'));
  print(buscarNumero2(1555555555324523557, '5'));
}

double intermedio(int a, int b) {
  int numeroMayor = max(a, b);
  int numeroMenor = min(a, b);
  double intermedio = (numeroMayor + numeroMenor) / 2;

  return intermedio;
}

int buscarNumero(int numero, String digito) {
  int cantidadDeInsidencias = 0;
  String numeroString = numero.toString();
  for (var i = 0; i < numeroString.length; i++) {
    if (numeroString[i] == digito) {
      cantidadDeInsidencias++;
    }
  }
  return cantidadDeInsidencias;
}

int buscarNumero2(int numero, String digito) {
  int cantidadDeInsidencias = 0;
  String numeroString = numero.toString();
  int contador = 0;
  while (contador < numeroString.length) {
    if (numeroString[contador] == digito) {
      cantidadDeInsidencias++;
    }
    contador++;
  }
  return cantidadDeInsidencias;
}
