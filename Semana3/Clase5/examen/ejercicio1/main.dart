void main(List<String> args) {
  List lista = [1, 2, 3, 4];
  print(sumanN(lista, 5));
}

bool sumanN(List lista, int n) {
  lista.sort();

  for (var i = 0; i < lista.length; i++) {
    int sum = 0;
    for (var j = i; j < lista.length; i++) {
      if (i != j) {
        sum += lista[j];
      } else {
        sum = lista[i];
      }
      if (sum == n) {
        return true;
      }
    }
  }

  return false;
}

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
