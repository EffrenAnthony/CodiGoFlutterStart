void main() {
  int numero1 = 6;
  int numero2 = 8;

  print("* " * numero2);
  for (var i = 0; i < numero1 - 2; i++) {
    print("* " + "  " * (numero2 - 2) + "* ");
  }
  print("* " * numero2);
}
