class Fecha {
  int dia;
  int mes;
  int anio;

  Fecha(int dia, int mes, int anio) {
    this.dia = dia;
    this.mes = mes;
    this.anio = anio;
  }
  String toString() => esValida() ? "${dia}/${mes}/${anio}" : 'Fecha no valida';

  bool esValida() {
    if (dia > 0 && mes > 0 && anio > 0) {
      return diaValido() && mesValido();
    }
    return false;
  }

  bool mesValido() {
    return mes <= 12 && mes > 0;
  }

  bool diaValido() {
    if (mes == 1) return dia <= 31;
    if (mes == 2 && !esBiciesto()) return dia <= 28;
    if (mes == 2 && esBiciesto()) return dia <= 29;
    if (mes == 3) return dia <= 31;
    if (mes == 4) return dia <= 30;
    if (mes == 5) return dia <= 31;
    if (mes == 6) return dia <= 30;
    if (mes == 7) return dia <= 31;
    if (mes == 8) return dia <= 31;
    if (mes == 9) return dia <= 30;
    if (mes == 10) return dia <= 31;
    if (mes == 11) return dia <= 30;
    if (mes == 12) return dia <= 31;

    return false;
  }

  bool esBiciesto() {
    if (anio % 400 == 0 || (anio % 100 != 0 && anio % 4 == 0)) {
      return true;
    }

    return false;
  }

  int devolverBiciesto(int a) {
    if (a % 400 == 0 || (a % 100 != 0 && a % 4 == 0)) {
      return 366;
    }

    return 365;
  }

  int devolverDiasMes(int m) {
    if (m == 1) return 31;
    if (m == 2 && !esBiciesto()) return 28;
    if (m == 2 && esBiciesto()) return 29;
    if (m == 3) return 31;
    if (m == 4) return 30;
    if (m == 5) return 31;
    if (m == 6) return 30;
    if (m == 7) return 31;
    if (m == 8) return 31;
    if (m == 9) return 30;
    if (m == 10) return 31;
    if (m == 11) return 30;
    if (m == 12) return 31;
    return 0;
  }

  int difDias(Fecha f) {
    return convertirFechaADias() - f.convertirFechaADias();
  }

  int convertirFechaADias() {
    int diasDeMeses = 0;
    for (var i = 0; i < (mes - 1); i++) {
      diasDeMeses += devolverDiasMes(i);
    }
    // int diasDeAnios = 365 * (anio - 1);
    int diasDeAnios = 0;

    for (var i = 0; i < (anio - 1); i++) {
      print(devolverBiciesto(i));
      diasDeAnios += devolverBiciesto(i);
    }

    int diasTotales = dia + diasDeMeses + diasDeAnios;

    return diasTotales;
  }
}
