import 'dart:math';

void main(List<String> args) {
  //sin especificar tipo de dato
  List general = [1, 2, 3, 4, 5];
  //Especificando tipo de dato
  List<int> numero = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 65, 234];
  general.add(6);
  general.add(7);
  general.add("Tony");
  print('-' * 50);
  print(general);
  print('-' * 50);
  imprimirLista(numero);

  programaMisterioso(numero);
  print(promedioLista(numero));
  print('-' * 50);
  print(mayorDeLista(numero));
  print('-' * 50);
  print(mayorDeListaRecursiva(numero));
  print('-' * 50);
  print(maximoElementosRecursivo(numero));
  print('-' * 50);
  print(ordenAscendente(numero));
  print('-' * 50);
  print(ordenDescendente(numero));
  print('-' * 50);
  print(buscarEnLista(numero, 13));
  print('-' * 50);
  print(busquedaBinariaIterativa(numero, 13));
  print('-' * 50);
  print(busquedaBinariaRecursiva(numero, 13));

  List<int> listasape = [];
  Random r = Random();
  for (int i = 0; i < 100000; i++) {
    listasape.add(r.nextInt(100000));
  }
  listasape.sort();
  listasape.contains(13);
}

void imprimirLista(List lista) {
  for (var i = 0; i < lista.length; i++) {
    print("El indice ${i} es ${lista[i]} ");
  }

  print('-' * 50);
  lista.forEach((element) {
    int index = 0;
    print("El indice ${index + 1} es ${element} ");
  });
  print('-' * 50);
}

void imprimirListaWhile(List lista) {
  int contador = 0;
  while (contador < lista.length) {
    print("El indice ${contador} es ${lista[contador]} ");
    contador++;
  }
  print('-' * 50);
}

void programaMisterioso(List numeros) {
  int suma = 0;
  for (int i = 0; i < numeros.length; i++) {
    suma += numeros[i];
  }
  print('Suma de numero en la lista = ${suma}');
  print('-' * 50);
}

double promedioLista(List lista) {
  int suma = 0;
  lista.forEach((element) {
    suma += element;
  });
  double promedio = suma / (lista.length + 1);

  return (promedio);
}

int mayorDeLista(List lista) {
  int mayor = 0;
  for (int i = 0; i < lista.length; i++) {
    if (lista[i] > mayor) {
      mayor = lista[i];
    }
  }

  return (mayor);
}

int mayorDeListaRecursiva(List lista) {
  int mayor = 0;
  int indice = 0;
  if (lista[indice] > mayor) {
    mayor = lista[indice];
  }
  indice++;

  if (indice > lista.length) {
    return mayor;
  }

  return mayorDeLista(lista);
}

int maximoElementosRecursivo(List numeros) {
  if (numeros.length == 2) {
    print('Comparamos ${numeros[0]} y ${numeros[1]} holi');
    return numeros[0] > numeros[1] ? numeros[0] : numeros[1];
  }
  int num1 = numeros[0];
  int num2 = maximoElementosRecursivo(numeros.sublist(1, numeros.length));
  print('comparamos ${num1} y ${num2}');
  return num1 > num2 ? num1 : num2;
}

bool ordenAscendente(List lista) {
  // bool esAscendente;
  for (var i = 0; i < lista.length - 1; i++) {
    if (lista[i] > lista[i + 1]) {
      return false;
    }
  }
  return true;
}

bool ordenDescendente(List lista) {
  for (var i = 0; i < lista.length - 1; i++) {
    if (lista[i] < lista[i + 1]) {
      return false;
    }
  }
  return true;
}

bool buscarEnLista(List numeros, int n) {
  for (var i = 0; i < numeros.length; i++) {
    print('entra');
    if (numeros[i] == n) {
      return true;
    }
  }
  return false;
}

bool busquedaBinariaIterativa(List numeros, int n) {
  int primero = 0;
  int ultimo = numeros.length - 1;
  bool encontrado = false;
  int medio;

  while (encontrado == false && primero <= ultimo) {
    print('${numeros[primero]} - ${numeros[ultimo]}');
    medio = ((primero + ultimo) / 2).floor();
    int posicion = -1;
    if (numeros[medio] == n) {
      posicion = medio;
      print('La posición es ${posicion}');
      encontrado = true;
    } else if (numeros[medio] > n) {
      ultimo = medio - 1;
    } else {
      primero = medio + 1;
    }
  }
  return encontrado;
}

bool busquedaBinariaRecursiva(List numeros, int n) {
  print("entra");
  int posmedio = (numeros.length / 2).floor();
  int medio = numeros[posmedio];
  if (medio == n) {
    return true;
  }
  if (numeros.length == 1) {
    return false;
  }
  if (n > medio) {
    return busquedaBinariaRecursiva(numeros.sublist(posmedio), n);
  } else {
    return busquedaBinariaRecursiva(numeros.sublist(0, posmedio), n);
  }
}
