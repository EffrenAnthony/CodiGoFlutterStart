import 'hora.dart';

void main(List<String> args) {
  Hora hora1 = new Hora.Formato24(20, 10);
  Hora hora2 = new Hora.Formato12(10, 10, 'pm');
  hora1.imprimirHora24();
  hora2.imprimirHora12();

  print(hora1 - hora2);
}
