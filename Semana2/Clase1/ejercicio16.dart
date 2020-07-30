void main() {
  int lado = 5;

  double cantFosforos = 3 * lado * (lado + 1) / 2;

  print(cantFosforos);

  int n = 5;
  int suma = 0;
  int cont = 1;
  while (cont <= n) {
    suma += cont;
    cont++;
  }
  print(suma * 3);
}
