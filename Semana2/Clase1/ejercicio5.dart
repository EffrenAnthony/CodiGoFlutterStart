void main(List<String> args) {
  int litrosNuestraPiscina = 2000;
  int litrosNuestroBalde = 5;
  int litrosNuestraPerdida = 2;

  int litrosVecinoPiscina = 3000;
  int litrosVecinoBalde = 7;
  int litrosVecinoPerdida = 2;

  if (litrosNuestraPiscina / (litrosNuestroBalde - litrosNuestraPerdida) >
      litrosVecinoPiscina / (litrosVecinoBalde - litrosVecinoPerdida)) {
    print('El vecino llenó mas rapido');
  } else {
    print('Nosotros llenamos mas rapido');
  }
}
