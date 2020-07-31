void main() {
  int num1 = 10;
  int num2 = 5;
  int num3 = 1;
  print(mayor(mayor(num1, num2), num3));

  print(fahrenheitACelius(100));

  print('El numero ${num1}: ${esPrimo(num1)}');

  print(traerPrimoAnterior(9005));

  print(obtenerToken("Tony"));
}

String obtenerToken(String usuario) {
  String token = '';
  for (var i = 0; i < usuario.length; i++) {
    token += usuario[usuario.length - i - 1];
  }
  print(usuario.length);
  return token;
}

int traerPrimoAnterior(int n) {
  int numeroPrimo;

  for (var i = 0; i < n; i++) {
    if (esPrimo(i)) {
      numeroPrimo = i;
    }
  }

  return numeroPrimo;
}

bool esPrimo(int n) {
  for (int cont = 2; cont < n / 2; cont++) if (n % cont == 0) return false;
  return true;
}

double fahrenheitACelius(double gradosFarhenheit) {
  return (gradosFarhenheit - 32) / 1.8;
}

int mayor(int numero1, int numero2) {
  if (numero1 > numero2) {
    return (numero1);
  } else if (numero2 > numero1) {
    return (numero2);
  }
}
