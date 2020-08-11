import 'trabajador.dart';

class Limpieza extends Trabajador {
  // Como obtenerSueldoTotal es un metodo abtracto, en la clse hija, tenemos que indicarle como es que va a actuar
  double obtenerSueldoTotal(int horas) {
    return horas * 0.8;
  }
}
