class Heroe {
  String nombre;
  List<String> poder;

  Heroe(String nombre, List<String> poder) {
    this.nombre = nombre;
    this.poder = poder;
  }

  String toString() => '${nombre} - ${poder}';
}
