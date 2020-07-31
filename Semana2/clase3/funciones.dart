void main(List<String> args) {
  // ImprimirRectangulo(5, 12);
  // ImprimirRectangulo(9);
  // ImprimirRectangulo(3, 5);
  print('Con un parametro');
  ImprimirRectangulo(2);
  print('Con dos parametros');
  ImprimirRectangulo(2, 5);
}

// ? Procedimientos

// En dart y en algunos otros lenguajes se puede utilizar los corchetes para definir ese argumento como opcional
void ImprimirRectangulo(int filas, [int columnas = 12]) {
  for (var i = 0; i < filas; i++) {
    print("* " * columnas);
  }
}

void TablaDeMultiplicar(int numero) {
  for (int i = 0; i <= 12; i++) {
    print('${numero} x ${i} = ${numero * i}');
  }
}

void ImprimirError(int numero, String causa) {
  print('Error: ');
  print("Numero: ${numero}");
  print('Causa: ${causa}');
}

// ? Método
int ObtenerMayor(int num1, int num2) {
  if (num1 > num2) {
    return num1;
  } else {
    return num2;
  }
}
