void main() {
  int n = 5;
  int suma = 0;
  int cont = 1;
  while (cont <= n) {
    suma += cont;
    cont++;
  }
  print("La sumatoria de 1 a ${n} es ${suma}");
}
