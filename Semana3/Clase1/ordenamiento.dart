import 'dart:math';

String respuesta = "";
void main() {
  List<int> desordenado = [9, 8, 6, 4, 1];
  List<int> ordenado = ordenarBurbuja(desordenado);
  print(ordenado);
  List<int> l1 = [0, 0, 0, 0, 0];
  List<int> l2 = [9, 8, 5, 6, 7];
}

double distanciaEuclidiana(List l1, List l2) {
  double dist = 0;
  for (var i = 0; i < l1.length; i++) {
    dist += pow(l1[i] - l2[i], 2);
  }
  return sqrt(dist);
}

double distanciaCamberra(List l1, List l2) {
  double dist = 0;
  for (var i = 0; i < l1.length; i++) {
    dist += (l1[i] - l2[i]).abs();
  }
  return dist;
}

double distancia(List l1, List l2) {
  return sqrt(pow(l1[0] - l2[0], 2) + pow(l1[1] - l2[1], 2));
}

List<int> ordenarBurbuja(List<int> lista) {
  for (var e = 0; e < lista.length - 1; e++) {
    for (var i = 0; i < lista.length - 1 - e; i++) {
      if (lista[i] > lista[i + 1]) {
        int temp = lista[i];
        lista[i] = lista[i + 1];
        lista[i + 1] = temp;
      }
    }
  }
  return lista;
}

List<int> ordenar(List<int> lista) {
  List<int> nuevo = [];
  int menor = lista[0];
  int size = lista.length;
  for (int e = 0; e < size; e++) {
    for (int i = 0; i < lista.length; i++) {
      if (menor > lista[i]) {
        menor = lista[i];
      }
    }
    lista.remove(menor);
    nuevo.add(menor);
    if (lista.length > 0) {
      menor = lista[0];
    }
  }
  return nuevo;
}
