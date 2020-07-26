import 'dart:math';

void main() {
  double a = 1;
  double b = 4;
  double c = 1;

  double determinante = b * b - 4 * a * c;
  double x1 = (b + sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
  double x2 = -(b - sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);

  if (determinante > 0) {
    print('${x1} y ${x2}');
  } else {
    print('no tiene solución');
  }
}
