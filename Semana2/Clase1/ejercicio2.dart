void main() {
  int n = 4;
  int cont = 1;
  int factorial = 1;
  while (cont <= n) {
    factorial = factorial * cont;
    cont++;
  }

  String factorialString = factorial.toString();
  print(factorial);
  print(factorialString[factorialString.length - 1]);
}
