import 'alumno.dart';
import 'asignatura.dart';

void main(List<String> args) {
  Alumno alm1 = new Alumno(
      codigo: 0,
      nombres: 'Tony',
      apellidos: 'Peña',
      genero: 'M',
      notaFinal: 20);
  Alumno alm2 =
      new Alumno(codigo: 1, nombres: 'Bel', genero: 'F', notaFinal: 18);
  Alumno alm3 = new Alumno(
      codigo: 2,
      nombres: 'Tony',
      apellidos: 'Peña',
      genero: 'M',
      notaFinal: 19);
  // alm1.codigo = 1;
  // alm1.nombres = 'Tony';
  // alm1.apellidos = 'Peña';
  // alm1.imprimir();
  // print(alm1);
  // print(alm2);

  // List<Alumno> alumnos = new List();
  // alumnos.add(alm1);
  // alumnos.add(alm2);
  // alumnos.add(alm3);

  // alumnos.forEach(print);

  Asignatura flutter = new Asignatura(codigo: 1, nombre: "CodigoFlutter");
  flutter.matricularAlumno(alm1);
  flutter.matricularAlumno(alm2);
  flutter.matricularAlumno(alm3);

  // flutter.retirarAlumno(alm1);
  flutter.imprimirAlumnos();
  print(flutter.obtenerDesaprobados());

  print(flutter.obtenerPrimerPuesto());
  print(flutter.obtenerUltimoPuesto());
  print(flutter.buscarAlumnoPorNombre('Annabel'));
  print(flutter.promedioDeLaClase());
}
