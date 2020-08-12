class A {
  String obtenerMensaje() => 'A';
}

class Ahijo with A {}

main(List<String> args) {
  Ahijo a = new Ahijo();
  print(a.obtenerMensaje());
}
