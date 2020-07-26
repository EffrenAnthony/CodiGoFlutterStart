void main() {
  int n = 10;
  int cont = 1;
  int factorial = 1;
  while (cont <= n) {
    factorial = factorial * cont;
    cont++;
  }

  print(factorial);
}
