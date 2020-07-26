void main() {
  double horasTrabajadas = 48;
  double pagoPorHora = 1;
  double horasExtra = horasTrabajadas - 40;
  double pagoHorasExtra;
  double pagoTotal;

  if (horasTrabajadas <= 40) {
    pagoTotal = pagoPorHora * horasTrabajadas;
  } else if (horasTrabajadas > 40 && horasTrabajadas <= 48) {
    pagoHorasExtra = pagoPorHora * 2 * (horasTrabajadas - 40);
    pagoTotal = pagoPorHora * 40 + pagoHorasExtra;
  } else if (horasTrabajadas > 48) {
    pagoHorasExtra =
        pagoPorHora * 2 * 8 + pagoPorHora * 3 * (horasTrabajadas - 48);
    pagoTotal = pagoPorHora * 40 + pagoHorasExtra;
  }

  if (horasExtra > 0) {
    print(
        'El pago total es ${pagoTotal} soles y se pagó ${pagoHorasExtra} soles por las ${horasExtra} horas extra ');
  } else {
    print('El pago total es ${pagoTotal} soles sin horas extra');
  }
}
