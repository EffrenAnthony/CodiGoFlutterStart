void main(List<String> args) {
  // print(factorialRecursivo(5));

  // print(fibonacci(10));
  // print(fibonacciBucle(10));
  // print(412 % 184);

  print(maxCDRecursivo(1000004, 1000003));
  print(maxCDEuclidesFor(1000004, 1000003));
}

int maxCDEuclidesFor(int num1, int num2) {
  while (num1 % num2 != 0) {
    num2 = num1 % num2;
    num1 = num2;
  }

  return num2;
}

int maxCDRecursivo(int num1, int num2) {
  if (num1 % num2 == 0) {
    return num2;
  }

  num2 = num1 % num2;
  num1 = num2;

  return maxCDRecursivo(num1, num2);
}

int maximoComunDivisor(int numero1, int numero2) {
  int numeroMenor = numero1;
  if (numero1 > numero2) {
    numeroMenor = numero2;
  }

  for (int i = numeroMenor; i > 0; i--) {
    if (numero1 % i == 0 && numero2 % i == 0) {
      return i;
    }
  }
  return 1;
}

int fibonacciBucle(int numero) {
  int fibonacci = 0;
  int numeroAnterior;
  int numeroAnteAnterior;

  if (numero == 0) {
    return 0;
  }
  if (numero == 1) {
    return 1;
  }
  int contador = 2;
  numeroAnteAnterior = 0;
  numeroAnterior = 1;
  while (contador <= numero) {
    fibonacci = numeroAnterior + numeroAnteAnterior;
    numeroAnteAnterior = numeroAnterior;
    numeroAnterior = fibonacci;
    contador++;
  }
  return fibonacci;
}

int fibonacci(int numero) {
  if (numero == 0) {
    return 0;
  }
  if (numero == 1) {
    return 1;
  }

  return fibonacci(numero - 1) + fibonacci(numero - 2);
}

int factorialRecursivo(int numero) {
  print(numero);
  // ! Siempre colocar la salida de la función recursiva, sino se ejecutará infinitamente
  if (numero == 1) {
    return 1;
  }
  return numero * factorialRecursivo(numero - 1);
}

int factorial(int numero) {
  int respuesta = 1;
  for (int i = 1; i <= numero; i++) {
    respuesta = respuesta * i;
  }
  return respuesta;
}
