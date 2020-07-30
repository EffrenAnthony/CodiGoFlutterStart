void main() {
  int hora = 3;
  int minutos = 55;
  String horaEspejo;

  if (hora == 12) {
    hora = 0;
  }

  if (minutos == 0) {
    horaEspejo = '${12 - hora}: ${0} ';
  } else {
    horaEspejo = '${11 - hora}: ${60 - minutos} ';
  }

  print(horaEspejo);
}

// if (hora == 12) {
//   horaEspejo = '${0}: ${0} ';
// }
