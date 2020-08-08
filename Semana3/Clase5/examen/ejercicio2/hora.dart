class Hora {
  int horas;
  int minutos;
  String time;

  Hora.Formato12(int horas12, int minutos12, String time) {
    this.horas = horas12;
    this.minutos = minutos12;
    this.time = time;
  }
  Hora.Formato24(int horas24, int minutos24) {
    this.horas = horas24;
    this.minutos = minutos24;
  }
  void imprimirHora12() {
    if (time != null) {
      print('${horas}:${minutos} ${time}');
    } else {
      print('El formato que se introdujo no es correcto');
    }
  }

  void imprimirHora24() {
    if (time == null) {
      print('${horas}:${minutos}');
    } else {
      print('El formato que se introdujo no es correcto');
    }
  }

  int operator -(Hora h) {
    return (60 * horas + minutos) - (60 * h.horas + h.minutos);
  }
}
