import 'administrativo.dart';
import 'asignatura.dart';
import 'alumno.dart';
import 'persona.dart';
import 'profesor.dart';
import 'trabajador.dart';
import 'voluntario.dart';

void main(List<String> args) {
  // Alumno a1 = new Alumno(nombres: 'Tony');
  // Alumno a2 = new Alumno(nombres: 'Tony 1');
  // Alumno a3 = new Alumno(nombres: 'Tony 2');
  Administrativo adm =
      new Administrativo(nombres: " administradorin ", sueldoPorHora: 10);
  // Alumno a = new Alumno(
  //     nombres: 'Anthony',
  //     apellidos: 'Peña',
  //     codigo: 1,
  //     correo: 'tony@gmail.com');
  // print(a);
  Profesor p = new Profesor(
      nombres: 'Steve',
      apellidos: 'Jobs',
      codigo: 1,
      correo: 'steve.jobs@apple.com',
      sueldoPorHora: 20);

  List<Trabajador> trabajadores = [];
  trabajadores.add(p);
  trabajadores.add(adm);

  Voluntario voluntario = new Voluntario();
  trabajadores.forEach((f) => {print(f.obtenerSueldoTotal(50))});
  print(adm.obtenerSueldoTotal(50));
  print(p.obtenerSueldoTotal(50));
  // print(p);

  // Asignatura asignatura =
  //     new Asignatura(nombre: "CodiGo", profesor: adm, alumnos: [a2, a3]);

  // asignatura += a1;
  // asignatura += a2;
  // print(asignatura);
}
