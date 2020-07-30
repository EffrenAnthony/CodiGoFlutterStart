void main(List<String> args) {
  int num1 = 2;
  int num2 = 3;

  int respuesta = ObtenerMayor(num1, num2);
  print(respuesta);
}

int ObtenerMayor(int num1, int num2) {
  if (num1 > num2) {
    return num1;
  } else {
    return num2;
  }
}
