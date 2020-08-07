import 'dart:math';

class Punto {
  double x;
  double y;

  Punto(double x, double y) {
    this.x = x;
    this.y = y;
  }

  String toString() {
    return 'ubicación';
  }

  // ? para hacer que una función se encuentre dentro de un operador
  // ? EL METODO SE LLAMA SOBRE CARGA DE OPERADORES
  double operator -(Punto p) {
    return sqrt(pow(this.x - p.x, 2) + pow(this.y - p.y, 2));
  }

  double distancia(Punto p) {
    return sqrt(pow(this.x - p.x, 2) + pow(this.y - p.y, 2));
  }
}
