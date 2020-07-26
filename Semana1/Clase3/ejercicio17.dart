void main() {
  double edad = 15;
  String enfermedad = 'Sida';
  double cantDias = 10;
  double costoDia;
  double costoTotal;

  if (enfermedad == 'Neumonia') {
    costoDia = 25;
  } else if (enfermedad == 'Tuberculosis') {
    costoDia = 16;
  } else if (enfermedad == 'ETS') {
    costoDia = 20;
  } else if (enfermedad == 'Sida') {
    costoDia = 32;
  }

  if (edad >= 14 && edad <= 22) {
    costoTotal = costoDia * (1.1) * cantDias;
  } else {
    costoTotal = costoDia * cantDias;
  }

  print('El costo total es: ${costoTotal}');
}
