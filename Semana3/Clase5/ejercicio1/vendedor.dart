class Vendeor {
  String nombre;
  List<double> ventas = new List();

  Vendeor(String nombre) {
    this.nombre = nombre;
  }

  void registrarVenta(double montoVenta) {
    if (ventas.length < 12) {
      ventas.add(montoVenta);
    } else {
      print('Ya se ingresaron todas las ventas del año');
    }
  }

  double obtenerTotalVentas() {
    // double ventasTotales = 0;
    // ventas.forEach((ventas) => {ventasTotales += ventas});
    // return ventasTotales;
    return ventas.reduce((venta1, venta2) => venta1 + venta2);
  }

  String toString() {
    return '${nombre}: ${obtenerTotalVentas()}';
  }
}
