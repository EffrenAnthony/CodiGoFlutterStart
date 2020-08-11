import 'persona.dart';
import 'trabajador.dart';

class Administrativo extends Trabajador {
  String cargo;

  Administrativo({
    int codigo,
    String nombres,
    String apellidos,
    String correo,
    double sueldoPorHora,
    this.cargo,
  }) : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo,
            sueldoPorHora: sueldoPorHora);

  @override
  String toString() {
    // TODO: implement toString
    return 'Adm: ' + super.toString();
  }

  @override
  double obtenerSueldoTotal(int horas) {
    if (horas > 40) {
      horas += horas - 40;
    }
    return horas * sueldoPorHora;
  }
}
