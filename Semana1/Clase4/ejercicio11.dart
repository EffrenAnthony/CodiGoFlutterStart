void main() {
  int a = 9;
  int b = 1;
  int c = 20;

  while (b <= c) {
    if (b % a == 0) {
      print('${b} es multiplo de ${a}');
    }
    b++;
  }
}
