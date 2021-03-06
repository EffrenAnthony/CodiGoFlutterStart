import 'persona.dart';

abstract class Trabajador extends Persona {
  double sueldoPorHora;
  Trabajador(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.sueldoPorHora})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);

  // Metodo abstracto
  double obtenerSueldoTotal(int horas);
}
