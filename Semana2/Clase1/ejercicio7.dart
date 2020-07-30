void main() {
  int horas = 1;
  int minutos = 55;
  int minTemp;

  if (horas < 23) {
    minTemp = 60 - minutos;
    minutos = (23 - horas) * 60 + minTemp;
  } else if (horas == 23) {
    minutos = 60 - minutos;
  }

  print("Faltan ${minutos} min");
}
