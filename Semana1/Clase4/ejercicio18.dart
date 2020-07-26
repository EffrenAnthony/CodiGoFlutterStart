void main() {
  for (int fila = 1; fila < 6; fila++) {
    String aux = "";
    for (int col = 0; col < fila; col++) {
      aux += (col + fila).toString() + "\t";
    }
    print(aux);
  }
}
