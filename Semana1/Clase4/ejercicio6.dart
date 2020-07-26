void main() {
  int n1 = 2;
  int n2 = 10;
  int cont = 1;
  int multi = n1;

  while (cont < n2) {
    multi = multi + n1;
    cont++;
  }

  print(multi);
}
