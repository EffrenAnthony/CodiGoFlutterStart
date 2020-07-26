void main() {
  int anio = 1804;

  if (anio % 400 == 0 || (anio % 100 != 0 && anio % 4 == 0)) {
    print("Si es bisiesto");
  } else {
    print("No es bisiesto");
  }
}
