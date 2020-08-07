import 'punto.dart';
import 'tienda.dart';

void main(List<String> args) {
  // Punto p = new Punto(4, 4);
  Punto miCasa = new Punto(0, 0);
  List<Tienda> tiendas = new List();
  tiendas.add(new Tienda('La tienda del PELUCA', new Punto(5, 4)));
  tiendas.add(new Tienda('La tienda del BANANERO', new Punto(-2, 3)));
  tiendas.add(new Tienda('La tienda del SUCIOPOTTER', new Punto(1, 8)));
  tiendas.add(new Tienda('LIBREIRA SAPE', new Punto(-1, -4)));
  print(tiendas);
  print(tiendas[0].ubicacion - (tiendas[1].ubicacion));
  print(miCasa.distancia(tiendas[1].ubicacion));
  Tienda cercana = tiendas[0];
  for (var i = 0; i < tiendas.length; i++) {
    if (cercana.ubicacion - miCasa > tiendas[i].ubicacion - miCasa) {
      cercana = tiendas[i];
    }
  }

  tiendas.sort(
      (t1, t2) => (t1.ubicacion - miCasa).compareTo(t2.ubicacion - miCasa));
  print(cercana);
  print(tiendas[0]);
}
