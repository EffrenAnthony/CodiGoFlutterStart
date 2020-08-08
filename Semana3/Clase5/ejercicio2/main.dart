import 'fecha.dart';

void main(List<String> args) {
  Fecha hoy = new Fecha(28, 2, 1205);
  Fecha otra = new Fecha(2, 8, 1205);
  print(hoy);

  print(hoy.difDias(otra));
}
