void main() {
  int lado = 3;

  double cantFosforos = 4 * lado * (lado + 1) / 2;

  print(cantFosforos);

  int n = 3;
  int suma = 0;
  int cont = 1;
  while (cont <= n) {
    suma += cont;
    cont++;
  }
  print(suma * 4);
}
