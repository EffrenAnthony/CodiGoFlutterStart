void main(List<String> args) {
  int ancho = 5;
  int largo = 5;

  int cantLocetas = largo * ancho;

  if (cantLocetas % 2 == 0) {
    print('locetas blancas ${cantLocetas / 2} y oscuras ${cantLocetas / 2}');
  } else {
    print(
        'Locetas claras ${(cantLocetas / 2).floor() + 1} y oscuras ${(cantLocetas / 2).floor()}');
  }
}
