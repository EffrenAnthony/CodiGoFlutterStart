void main() {
  int numeroEntrada = 8;
  int num1 = 17;
  int suma = 0;

  String num1String = num1.toString();
  for (var i = 0; i < num1String.length; i++) {
    suma = suma + int.parse(num1String[i]);
  }
  if (suma == numeroEntrada) {
    print('la suma de dijitos de ${num1} es igual a ${numeroEntrada}');
  } else {
    print('La suma de dijitos de ${num1} NO es igual a ${numeroEntrada}');
  }
}
