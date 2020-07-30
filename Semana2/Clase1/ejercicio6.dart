void main(List<String> args) {
  int cerillasTotal = 1000;
  int cerillasRetirar = 10;

  int turnos = 1;

  do {
    turnos++;
    cerillasTotal -= cerillasRetirar;
  } while (cerillasTotal > cerillasRetirar);

  print(turnos);
}
