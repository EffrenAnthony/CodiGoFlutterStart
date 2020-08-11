import 'persona.dart';

class Alumno extends Persona {
  double pension;
  List<String> materias;
  Alumno(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.pension,
      this.materias})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);

  @override
  String toString() {
    return "Alm." + super.toString();
  }
}
