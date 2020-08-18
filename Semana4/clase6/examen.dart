import 'dart:io';

main(List<String> args) {
  List hola = ['hola', 'perro', 'come', 'gato', 'animal'];
  invertirLista(hola);
  print('-' * 50);
  List lista = crearLista(3);
  print('-' * 50);
  invertirLista(lista);
}

List invertirLista(List lista) {
  List listaInvertida = [];
  // for (var i = lista.length - 1; i >= 0; i--) {
  for (var i = 0; i < lista.length; i++) {
    listaInvertida.add(lista[lista.length - i - 1]);
  }
  print('Lista Invertida $listaInvertida');
  return listaInvertida;
}

List crearLista(int items) {
  List nuevaLista = [];
  print('Lista nueva de $items elementos');
  print('-' * 50);
  for (var i = 0; i < items; i++) {
    print('Agrega el elemento ${i + 1}');
    String palabra = stdin.readLineSync();
    nuevaLista.add(palabra);
  }
  print('-' * 50);
  print('Lista creada:  $nuevaLista');
  return nuevaLista;
}
