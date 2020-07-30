import 'dart:math';

void main(List<String> args) {
  double lunes = 0;
  double martes = 15;
  double miercoles = 25;
  double jueves = 100;
  double viernes = 10;
  double sabado = 200;
  double domingo = 500;
  double media = (lunes + martes + miercoles + jueves + viernes + sabado) / 6;
  String diaMasVentas;
  String diaMenosVentas;

  double sub_max1 = max(lunes, martes);
  double sub_max2 = max(sub_max1, miercoles);
  double sub_max3 = max(sub_max2, jueves);
  double sub_max4 = max(sub_max3, viernes);
  double sub_max5 = max(sub_max4, sabado);
  double sub_max = max(sub_max5, domingo);

  double sub_min1 = min(lunes, martes);
  double sub_min2 = min(sub_min1, miercoles);
  double sub_min3 = min(sub_min2, jueves);
  double sub_min4 = min(sub_min3, viernes);
  double sub_min5 = min(sub_min4, sabado);
  double sub_min = min(sub_min5, domingo);

  if (sub_max == lunes) {
    diaMasVentas = 'lunes';
  }
  if (sub_max == martes) {
    diaMasVentas = 'martes';
  }
  if (sub_max == miercoles) {
    diaMasVentas = 'miercoles';
  }
  if (sub_max == jueves) {
    diaMasVentas = 'jueves';
  }
  if (sub_max == viernes) {
    diaMasVentas = 'viernes';
  }
  if (sub_max == sabado) {
    diaMasVentas = 'sabado';
  }
  if (sub_max == domingo) {
    diaMasVentas = 'domingo';
  }

  if (sub_min == lunes) {
    diaMenosVentas = 'lunes';
  }
  if (sub_min == martes) {
    diaMenosVentas = 'martes';
  }
  if (sub_min == miercoles) {
    diaMenosVentas = 'miercoles';
  }
  if (sub_min == jueves) {
    diaMenosVentas = 'jueves';
  }
  if (sub_min == viernes) {
    diaMenosVentas = 'viernes';
  }
  if (sub_min == sabado) {
    diaMenosVentas = 'sabado';
  }
  if (sub_min == domingo) {
    diaMenosVentas = 'domingo';
  }

  print("El dia que menos vende es: ${diaMasVentas}");
  print("El dia que mas vende es: ${diaMenosVentas} ");

  if (media > domingo) {
    print("La media de la semana supera a las ventas del domingo");
  } else {
    print("La media de la semana NO supera a las ventas del domingo");
  }
}
