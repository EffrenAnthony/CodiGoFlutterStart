void main() {
  int cantidadGotas = 3600;
  int cantidadHoras = (cantidadGotas / 3600).floor();

  cantidadGotas -= cantidadHoras * 3600;

  int cantidadMinutos = (cantidadGotas / 60).floor();

  cantidadGotas -= cantidadMinutos * 60;
  // double cantidadMinutos = cantidadHoras

  print(
      'tiempo maximo sin cambiar el cubo = ${cantidadHoras}:${cantidadMinutos}:${cantidadGotas}');
}
