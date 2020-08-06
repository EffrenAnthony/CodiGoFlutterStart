import 'alumno.dart';

class Asignatura {
  int codigo;
  String nombre;
  String horario;
  String seccion;
  int duracionEnHoras;
  // creamnos una lista de alumnos de tipo Alumno
  List<Alumno> alumnos = new List();

  Asignatura(
      {this.codigo,
      this.nombre,
      this.horario,
      this.seccion,
      this.duracionEnHoras});

  String toString() {
    return '${codigo}  ${nombre}';
  }

  void imprimirAlumnos() {
    for (var i = 0; i < alumnos.length; i++) {
      print(alumnos[i]);
    }
  }

  void matricularAlumno(Alumno a) {
    alumnos.add(a);
  }

  void retirarAlumno(Alumno a) {
    alumnos.remove(a);
  }

  int obtenerDesaprobados() {
    // ? ----------- VARIABLE PARA LOS PTRES PRIMEROS METODOS
    // int cantDesaprobado = 0;
    // ? CON FOREACH
    // alumnos.forEach((alumno) => {if (alumno.notaFinal < 11) cantDesaprobado++});
    // ? CON FOREACH OPERADOR TERNARIO
    // alumnos.forEach((alumno) => {alumno.notaFinal < 11 ? cantDesaprobado++ : cantDesaprobado += 0});
    // ? CON CICLO FOR
    // for (var i = 0; i < alumnos.length; i++) {
    //   if (alumnos[i].notaFinal < 11) {
    //     cantDesaprobado++;
    //   }
    // }
    // ? ---------------------- RETURN PARA LOS METODOS ANTERIORES
    // return cantDesaprobado;
    // ? ----------------------
    // ? CON WHERE -> va a crear una lista donde agregará a cada alumno donde la nota sea menor que 11
    List desaprobados = alumnos.where((item) => item.notaFinal < 11).toList();

    return desaprobados.length;
  }

  // ? UTILIZANDO SORT PARA ORDENAR Y DEVOLVER EL PRIMER ALUMNO
  // Alumno obtenerPrimerPuesto() {

  //   alumnos.sort(
  //       (alumno1, alumno2) => alumno2.notaFinal.compareTo(alumno1.notaFinal));
  //   return alumnos[0];
  // }

  // ? OBTENER ALUMNO CON FOR E IF
  // Alumno obtenerPrimerPuesto() {
  //   Alumno a = alumnos[0];
  //   for (int i = 0; i < alumnos.length; i++) {
  //     if (alumnos[i].notaFinal > a.notaFinal) a = alumnos[i];
  //   }
  //   return a;
  // }

  // ? OBTENER ALUMNO CON FOREACH
  Alumno obtenerPrimerPuesto() {
    Alumno primerPuesto = alumnos[0];
    alumnos.forEach((alumno) =>
        {if (alumno.notaFinal > primerPuesto.notaFinal) primerPuesto = alumno});
    return primerPuesto;
  }

  Alumno obtenerUltimoPuesto() {
    Alumno a = alumnos[0];
    alumnos
        .forEach((alumno) => {if (alumno.notaFinal < a.notaFinal) a = alumno});
    return a;
  }

  bool buscarAlumnoPorNombre(String nombre) {
    alumnos.forEach((alumno) => {
          (alumno.nombres.toLowerCase() == nombre.toLowerCase()) ? true : false
        });
    return false;
  }

  double promedioDeLaClase() {
    double suma = 0;
    double promedio = 0;
    // for (var i = 0; i < alumnos.length; i++) {
    //   suma = suma + alumnos[i].notaFinal;
    // }
    alumnos.forEach((alumno) => {suma += alumno.notaFinal});

    promedio = suma / alumnos.length;
    return promedio;
  }
}
