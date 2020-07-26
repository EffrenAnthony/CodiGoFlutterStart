void main() {
  int n1 = 10;
  int n2 = -3;
  int cont = 1;
  int div = n1;

  if (n1 % n2 == 0) {
    while (div > n2) {
      div = div - n2;
      cont++;
    }
    print('La division es: ${cont}');
  } else {
    print('la operación no es exacta');
    cont = 0;
    while (div > n2) {
      div = div - n2;
      cont++;
    }
    print('El resultado es: ${cont} y residuo ${div}');
  }
}
