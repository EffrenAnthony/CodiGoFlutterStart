void main() {
  int cantDiscos = 5000;
  String disco;
  if (cantDiscos < 2500) {
    disco = 'Aun no haz alcanzdo un disco';
  } else if (cantDiscos >= 2500 && cantDiscos < 5000) {
    disco = 'Disco de Platino';
  } else if (cantDiscos >= 5000 && cantDiscos < 10000) {
    disco = 'Disco de Oro';
  }

  print('Obtuviste el premio: ${disco}');
}
