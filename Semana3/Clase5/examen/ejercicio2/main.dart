import 'hora.dart';

void main(List<String> args) {
  Hora hora1 = new Hora.Formato24(22, 40);
  Hora hora2 = new Hora.Formato12(11, 20, 'am');
  hora1.imprimirHora24();
  hora1.imprimirHora12();
  hora2.imprimirHora12();
  hora2.imprimirHora24();

  print(hora1 - hora2);
}
