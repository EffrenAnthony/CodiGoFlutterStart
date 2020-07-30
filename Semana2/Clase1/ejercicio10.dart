void main(List<String> args) {
  int costeCompra = 4185;
  int pagoEntregado = 52051;

  int cambio = pagoEntregado - costeCompra;
  print('Total de cambio: ${cambio}');

  if (cambio <= 0) {
    print('Debe ${cambio.abs()}');
  } else {
    print('vuelto');
    int bill100 = (cambio / 100).floor();
    print('Billetes de 100: ${bill100}');
    int bill50 = ((cambio - (bill100 * 100)) / 50).floor();
    print('Billetes de 50: ${bill50}');
    int bill20 = ((cambio - (bill100 * 100 + bill50 * 50)) / 20).floor();
    print('Billetes de 20: ${bill20}');
    int bill10 =
        ((cambio - (bill100 * 100 + bill50 * 50 + bill20 * 20)) / 10).floor();
    print('Billetes de 10: ${bill10}');
    int mon5 =
        ((cambio - (bill100 * 100 + bill50 * 50 + bill20 * 20 + bill10 * 10)) /
                5)
            .floor();
    print('Monedas de 5: ${mon5}');
    int mon2 = ((cambio -
                (bill100 * 100 +
                    bill50 * 50 +
                    bill20 * 20 +
                    bill10 * 10 +
                    mon5 * 5)) /
            2)
        .floor();
    print('Monedas de 2: ${mon2}');
    int mon1 = (cambio -
            (bill100 * 100 +
                bill50 * 50 +
                bill20 * 20 +
                bill10 * 10 +
                mon5 * 5 +
                mon2 * 2))
        .floor();
    print('Monedas de 1: ${mon1}');
  }
}
