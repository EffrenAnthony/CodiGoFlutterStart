void main(List<String> args) {
  // dist metros
  double distEntreCamaras = 1000;
  // vel max en km/h
  int velMax = 110;
  // tiempo en segundos
  double segRec = 40;

  double distEntreCamarasKiloMetros = distEntreCamaras / 1000;
  double segRecAMin = segRec / 60;
  double segRecHora = segRecAMin / 60;

  int velReal = (distEntreCamarasKiloMetros / segRecHora).floor();

  if (velReal < velMax) {
    print("velocidad ${velReal}km/h < ${velMax}km/h => Ok");
  } else if (velReal > velMax && velReal < velMax * 1.2) {
    print("velocidad ${velReal}km/h > ${velMax}km/h Multa");
  } else if (velReal >= velMax * 1.2) {
    print("velocidad ${velReal}km/h >= ${velMax * 1.2}km/h Puntos");
  } else if (velReal < 0) {
    print('velocidad ${velReal} < 0 => ERROR');
  }
}
