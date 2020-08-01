import 'dart:math';

// variable global
String respuesta = '';
void main(List<String> args) {
  // print(areaRectangulo(15, 10));
  // print(relacion(10, 10));
  arbolfibonacci(4, 2);
  print(respuesta);
}

int areaRectangulo(int largo, int ancho) => largo * ancho;
double areaCirculo(int radio) => pi * pow(radio, 2);
int relacion(int a, int b) {
  if (a > b) return 1;
  if (b > a) return -1;
  return 0;
}

// condición, ? resultado : condición ? resultado : resultado
int relacionCorta(int a, int b) {
  return a > b ? 1 : b > a ? -1 : 0;
}

int arbolfibonacci(int i, int espacios) {
  if (i == 0) {
    return 0;
  }
  if (i == 1) {
    return 1;
  }
  int f1 = arbolfibonacci(i - 1, espacios + 1);
  respuesta = ("\t " * espacios) + f1.toString() + '\n' + respuesta;
  // print(("\t " * espacios) + f1.toString());
  int f2 = arbolfibonacci(i - 2, espacios + 1);
  respuesta = ("\t " * espacios) + f2.toString() + '\n' + respuesta;
  // print(("\t " * espacios) + f2.toString());

  return f1 + f2;
}
