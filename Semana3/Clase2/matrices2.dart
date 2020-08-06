import 'dart:math';

void main(List<String> args) {
  var num1 = generarMatriz(3, 3);
  var num2 = generarMatriz(2, 2);
  // imprimirLista2(num1);
  // imprimirLista(num1);
  // print(num1);
  var ejemplo = [
    [2, 0, 0],
    [0, 2, 0],
    [0, 0, 2]
  ];

  imprimirLista(ejemplo);
  print(esTriangularSuperior(ejemplo));
  print(esEscalar(ejemplo, 2));
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

void imprimirLista(List l) {
  // por each recorre los items de la lsita y dentro de cada item
  // join unira cada item con un tab
  // Ej. item1 = [1 tab 2 tab 3 tab] -->> todo en un string
  l.forEach((fila) => {print(fila.join('\t'))});
}

void imprimirLista2(List l) {
  l.forEach(imprimirFila);
}

void imprimirFila(var fila) {
  String filaimpresa = "";
  fila.forEach((alumno) => {filaimpresa += "${alumno} \t"});
  print(filaimpresa);
}

bool esTriangularSuperior(List<List<int>> l) {
  for (var i = 0; i < l.length; i++) {
    for (var j = 0; j < i; j++) {
      // if (i > j) {
      if (l[i][j] != 0) {
        return false;
      }
      // }
    }
  }
  return true;
}

bool esEscalar(List<List<int>> l, int n) {
  for (var i = 0; i < l.length; i++) {
    for (var j = 0; j == i; j++) {
      if (l[i][j] != n) {
        return false;
      }
    }
  }
  return true;
}

bool generarCuadradoMagico(List<List<int>> l) {
  int m = l.length;
  if (m % 2 != 0) {
    print('Nola');
    return null;
  }
  int sumaCol = 0;
  int sumaFila = 0;
  int sumaDiag = 0;

  for (var i = 0; i < l.length; i++) {
    for (var j = 0; j == i; j++) {
      sumaDiag += l[i][j];
    }
  }
  for (var i = 0; i < l.length; i++) {
    for (var j = 0; j == i; j++) {
      sumaDiag += l[i][j];
    }
  }
  return true;
}
