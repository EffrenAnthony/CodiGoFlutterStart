void main() {
  String palabra = 'holi';
  int contador = 0;
  int contadorVocales = 0;
  String letra;
  while (contador < palabra.length) {
    letra = palabra[contador];
    if (letra == 'a') {
      contadorVocales++;
    } else if (letra == 'e') {
      contadorVocales++;
    } else if (letra == 'i') {
      contadorVocales++;
    } else if (letra == 'o') {
      contadorVocales++;
    } else if (letra == 'u') {
      contadorVocales++;
    }
    contador++;
  }

  if (contadorVocales == 5) {
    print('Es Pentavocalica');
  } else {
    print('NO es Pentavocalica');
  }
}
