void main() {
  int n = 32;
  int cont = 2;
  bool primo = false;
  bool noPrimo = false;

  while (primo == false && noPrimo == false) {
    if (n % cont == 0 && n == cont) {
      primo = true;
    } else if (n % cont == 0 && n != cont) {
      noPrimo = true;
    }
    cont++;
  }

  if (primo == true) {
    print('Es primo: ${primo}');
  } else {
    print('No es primo');
  }
}
