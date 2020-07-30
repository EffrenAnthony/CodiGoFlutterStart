void main(List<String> args) {
  double n = 6;
  double factorial = 1;
  int cont = 1;
  double n2 = 25;

  while (cont <= n) {
    factorial = factorial * cont;
    cont++;
  }

  if (factorial % n2 == 0) {
    print('${n}! es divisible entre ${n2}');
  } else {
    print('${n}! NO  es divisible entre ${n2}');
  }
}
