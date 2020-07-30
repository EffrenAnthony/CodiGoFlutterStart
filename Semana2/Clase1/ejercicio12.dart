void main(List<String> args) {
  int numCompartimientos = 5;
  int litrosDelMasGrande = 10;
  int difEntreCompartiminetos = 2;

  int litrosTotales = 0;

  if (litrosDelMasGrande / difEntreCompartiminetos < numCompartimientos) {
    print(
        'Debes reducir el numero de compartimientos o reducir la diferencia entre ellos');
  } else {
    for (var i = 0; i < numCompartimientos; i++) {
      litrosTotales += litrosDelMasGrande;
      litrosDelMasGrande = litrosDelMasGrande - difEntreCompartiminetos;
    }
  }

  print('Se necesitan ${litrosTotales}');
}
