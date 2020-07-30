void main(List<String> args) {
  int numero = 4;
  int contador = 0;
  String numeroEscrito = '';
  for (var i = 1; i <= numero; i++) {
    contador += i;
    numeroEscrito += i.toString();
  }

  if (contador % 3 == 0) {
    print(numeroEscrito);
    print('es divisible por 3');
  } else {
    print(numeroEscrito);
    print('NO es divisible por 3');
  }
}
