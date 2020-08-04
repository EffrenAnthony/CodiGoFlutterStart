import 'dart:math';

void main(List<String> args) {
  var num1 = generarMatriz(3, 2);
  var num2 = generarMatriz(2, 2);
  //para usar más adelante en las pruebas

  print(num1);
  print('-' * 100);
  imprimirMatriz(num1);
  print('-' * 100);
  imprimirMatriz(num2);
  print('-' * 100);
  print(esNula(num1));
  print('-' * 100);
  print(sonIguales(num1, num2));
  print('-' * 100);
  imprimirMatriz(sumaMatrices(num1, num2));
  print('-' * 100);
  imprimirMatriz(restaMatrices(num1, num2));
  print('-' * 100);
  imprimirMatriz(num1);
  print('Transpuesta');
  imprimirMatriz(transpuesta(num1));
}

void imprimirMatriz(List lista) {
  for (var i = 0; i < lista.length; i++) {
    String item = '';
    for (var j = 0; j < lista[i].length; j++) {
      String itemAString = lista[i][j].toString();
      item += itemAString + '\t';
    }
    print(item);
  }
}

bool esNula(List lista) {
  for (var i = 0; i < lista.length; i++) {
    for (var j = 0; j < lista[i].length; j++) {
      if (lista[i][j] != 0) {
        print('La matriz no es nula');
        return false;
      }
    }
  }

  return true;
}

List generarMatriz(int i, int j) {
  List num1 = [];
  var rng = new Random();
  for (int fil = 0; fil < i; fil++) {
    num1.add([]);
    for (int col = 0; col < j; col++) {
      num1[fil].add(rng.nextInt(100));
    }
  }

  return num1;
}

bool sonIguales(List l1, List l2) {
  if (l1.length != l2.length) return false;
  for (var i = 0; i < l1.length; i++) {
    if (l1[i].length != l2[i].length) return false;
    for (var j = 0; j < l1[i].length; j++) {
      if (l1[i][j] == l2[i][j]) return true;
    }
  }

  return false;
}

List sumaMatrices(List l1, List l2) {
  List suma = [];
  List nula = [];
  if (l1.length != l2.length) {
    print('no se puede sumar, las dimensiones de las matrices no son iguales');
    return nula;
  }
  for (var i = 0; i < l1.length; i++) {
    if (l1[i].length != l2[i].length) {
      print(
          'no se puede sumar, las dimensiones de las matrices no son iguales');
      return nula;
    }
    suma.add([]);
    for (var j = 0; j < l1[i].length; j++) {
      suma[i].add(l1[i][j] + l2[i][j]);
    }
  }

  return suma;
}

List restaMatrices(List l1, List l2) {
  List resta = [];
  List nula = [];
  if (l1.length != l2.length) {
    print('no se puede , las dimensiones de las matrices no son iguales');
    return nula;
  }
  for (var i = 0; i < l1.length; i++) {
    if (l1[i].length != l2[i].length) {
      print('no se puede , las dimensiones de las matrices no son iguales');
      return nula;
    }
    resta.add([]);
    for (var j = 0; j < l1[i].length; j++) {
      resta[i].add(l1[i][j] - l2[i][j]);
    }
  }

  return resta;
}

List transpuesta(List lista) {
  List transpuesta = [];
  int numfilas = 0;
  int numCol = 0;
  for (var i = 0; i < lista.length; i++) {
    numfilas++;
    for (var j = 0; j < lista[i].length; j++) {
      numCol++;
    }
  }

  for (var i = 0; i < numCol / numfilas; i++) {
    transpuesta.add([]);
    for (var j = 0; j < numfilas; j++) {
      transpuesta[i].add(lista[j][i]);
    }
  }
  return transpuesta;
}
