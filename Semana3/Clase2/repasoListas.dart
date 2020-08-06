import 'dart:io';

void main(List<String> args) {
  List<String> alumnos = llenarAlumnos();
  // List<String> alumnosOrdenados = ordenarListaAlF(alumnos);
  // List<String> alumnosOrdenados = alumnos;
  // alumnos.sort(); -> Ordena Alfabeticamente o de menor a mayor;
  // alumnos.sort(compararTamanioString);
  alumnos.sort((val1, val2) => val2.length.compareTo(val1.length));
  print('-' * 50);
  imprimirListaAlumnos(alumnos);
}

int compararTamanioString(String a, String b) {
  if (a.length > b.length) {
    return 1;
  }
  return 0;
}

List ordenarListaTam(List<String> alumnos) {
  for (int i = 0; i < alumnos.length; i++) {
    for (int e = 0; e < alumnos.length - 1; e++) {
      if (alumnos[e].length > alumnos[e + 1].length) {
        var tmp = alumnos[e];
        alumnos[e] = alumnos[e + 1];
        alumnos[e + 1] = tmp;
      }
    }
  }
  return alumnos;
}

List ordenarListaAlF(List<String> alumnos) {
  for (int i = 0; i < alumnos.length; i++) {
    for (int e = 0; e < alumnos.length - 1; e++) {
      if (alumnos[e].codeUnitAt(0) > alumnos[e + 1].codeUnitAt(0)) {
        var tmp = alumnos[e];
        alumnos[e] = alumnos[e + 1];
        alumnos[e + 1] = tmp;
      }
    }
  }
  return alumnos;
}

List llenarAlumnos() {
  List<String> alumnos = [];
  print('Escribe los nombre de los alumnos:');
  String nombre = stdin.readLineSync();
  while (nombre != 'salir') {
    alumnos.add(nombre);
    nombre = stdin.readLineSync();
  }
  // print('Se registraron: ');
  // print(alumnos);

  // Convertimos al mapa ( el mapa es una variable clave par, tioene un indice y un valor)
  alumnos.asMap().forEach((key, value) {
    print('${key + 1}.- ${value}');
  });
  return alumnos;
}

void imprimirListaAlumnos(List alumnos) {
  print('Los alumnos registrados son: ');
  for (var i = 0; i < alumnos.length; i++) {
    print('${i + 1}.- ${alumnos[i]}');
  }
}

void imprimirListaAlumnos2(List alumnos) {
  print('Los alumnos registrados son: ');
  alumnos.forEach((alumno) => {print(alumno)});
}
