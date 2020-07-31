void main() {
  muestranomultiplos(15, 3);
}

void muestranomultiplos(int limite, multiplo) {
  String respuesta = "";
  for (int i = 1; i < limite; i++) {
    if (i % multiplo != 0) {
      respuesta = respuesta + i.toString() + " ";
    }
  }
  print(respuesta);
}
