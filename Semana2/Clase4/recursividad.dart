void main(List<String> args) {
  // print(factorialRecursivo(5));

  print(fibonacci(10));
  print(fibonacciBucle(10));
}

int maxComunDivisor(int num1, int num2) {
  int numeroMenor = num1;
  if (num1 > num2) {
    numeroMenor = num2;
  }
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
  if (numero == 0) {
    fibonacci = 0;
  }
  if (numero == 1) {
    fibonacci = 1;
  }

  int inicioFibonacci = 2;
  fibonacci = inicioFibonacci;

  while (inicioFibonacci <= numero) {
    fibonacci = inicioFibonacci;
    fibonacci = inicioFibonacci - 1 + inicioFibonacci - 2;
    inicioFibonacci++;
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
