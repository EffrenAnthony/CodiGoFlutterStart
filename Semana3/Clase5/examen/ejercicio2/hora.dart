class Hora {
  int horas;
  int minutos;
  String time;

  Hora.Formato12(int horas12, int minutos12, String time) {
    this.minutos = minutos12;
    this.time = time;
    if (time == 'pm') {
      this.horas = horas12 + 12;
    } else if (time == 'am') {
      this.horas = horas12;
    } else {
      print('Formato de 12 horas no valido');
      return;
    }
  }
  Hora.Formato24(int horas24, int minutos24) {
    this.horas = horas24;
    this.minutos = minutos24;
  }
  void imprimirHora12() {
    if (horas <= 12) {
      print("${horas}: ${minutos} a.m");
    } else {
      print("${horas - 12}: ${minutos} p.m");
    }
  }

  void imprimirHora24() {
    print("${horas}: ${minutos}");
  }

  int operator -(Hora h) {
    return (60 * horas + minutos) - (60 * h.horas + h.minutos);
  }
}
