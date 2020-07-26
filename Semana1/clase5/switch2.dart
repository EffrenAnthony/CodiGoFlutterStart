void main() {
  int anio = 2001;
  int mes = 2;

  switch (mes) {
    case 1:
      print(31);
      break;
    case 2:
      if (anio % 400 == 0 || (anio % 100 != 0 && anio % 4 == 0)) {
        print("Si es bisiesto");
        print(29);
      } else {
        print("No es bisiesto");
        print(28);
      }
      break;
    case 3:
      print(31);
      break;
    case 4:
      print(30);
      break;
    case 5:
      print(31);
      break;
    case 6:
      print(30);
      break;
    case 7:
      print(31);
      break;
  }
}
