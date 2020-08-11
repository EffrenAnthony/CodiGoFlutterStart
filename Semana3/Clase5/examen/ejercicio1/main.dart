void main(List<String> args) {
  List<int> lista = [1, 3, 7, 2, 3];
  print(encontrar2(lista, 28));
}

bool encontrar2(List<int> numeros, int numero) {
  List<int> sumas = [];
  for (int i = 0; i < numeros.length; i++) {
    sumas.add(numeros[i]);
    if (numero == numeros[i]) return true;
  }
  print(sumas);
  for (int j = 0; j < numeros.length - 1; j++) {
    List<int> temporal = [];
    for (int i = 0; i < numeros.length; i++) {
      for (int e = i + 1; e < numeros.length; e++) {
        temporal.add(sumas[i] + numeros[e]);
        if (numero == sumas[i] + numeros[e]) return true;
      }
    }
    sumas = temporal;
    print(sumas);
  }
  return false;
}

// bool sumanN(List lista, int n) {
//   lista.sort();

//   for (var i = 0; i < lista.length; i++) {
//     int sum = 0;
//     for (var j = i; j < lista.length; i++) {
//       if (i != j) {
//         sum += lista[j];
//       } else {
//         sum = lista[i];
//       }
//       if (sum == n) {
//         return true;
//       }
//     }
//   }

//   return false;
// }

// for (var i = 0; i < (lista.length - 1); i++) {
//   sum =
//   for (var j = 0; j < lista.length - 1; j++) {
//     if (i != j + 1) {
//       sum += lista[i];
//       if (sum == n) {
//         return true;
//       }
//     }
//   }
// }

// for (var i = 0; i < lista.length; i++) {
//   int sumPar = 0;
//   for (var j = i; j < lista.length; j++) {
//     // print(i);
//     if (i != j) {
//       for (var k = j; k < lista.length; k++) {
//         print(k);
//         if (j != k) {}
//       }
//       sumPar += lista[j];
//     } else {
//       sumPar = lista[i];
//     }
//     if (sumPar == n) {
//       return true;
//     }
//   }
// }
