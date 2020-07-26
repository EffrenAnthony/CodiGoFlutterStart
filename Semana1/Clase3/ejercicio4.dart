void main() {
  double sueldo = 45000;
  int porcentaje;
  String mostrar;

  if (sueldo <= 0) {
    mostrar = 'Sueldo No valido';
  } else if (sueldo < 10000) {
    porcentaje = 3;
  } else if (sueldo < 20000) {
    porcentaje = 7;
  } else if (sueldo < 30000) {
    porcentaje = 9;
  } else if (sueldo < 40000) {
    porcentaje = 13;
  } else if (sueldo < 50000) {
    porcentaje = 16;
  } else {
    porcentaje = 20;
  }

  double sueldoNeto = sueldo * (100 - porcentaje) / 100;
  mostrar =
      'El sueldo es ${sueldo} y el impuesto a pagar es del ${porcentaje}%, y l sueldo neto es de ${sueldoNeto}';

  print(mostrar);
}
