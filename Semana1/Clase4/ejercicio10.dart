void main() {
  int n = 49;
  int raiz = 0;
  int cont = 1;
  int resta = n - 0;

  while (resta >= cont) {
    raiz++;
    print('${raiz} ${resta} - ${cont} = ${resta - cont}');
    resta = resta - cont;
    cont += 2;
  }

  print('La raiz cuadrada de ${n} es ${raiz}');
}
