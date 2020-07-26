void main() {
  int edad = 15;
  double precio;
  String mensaje;

  if (edad <= 0) {
    mensaje = 'Valor no valido';
  } else if (edad < 4) {
    precio = 0;
    mensaje = 'El cliente debe pagar ${precio} soles';
  } else if (edad < 18) {
    precio = 5;
    mensaje = 'El cliente debe pagar ${precio} soles';
  } else {
    precio = 10;
    mensaje = 'El cliente debe pagar ${precio} soles';
  }

  print(mensaje);
}
