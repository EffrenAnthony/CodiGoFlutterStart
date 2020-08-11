abstract class Persona {
  int codigo;
  String nombres;
  String apellidos;
  String correo;

  Persona({this.codigo, this.nombres, this.apellidos, this.correo});

  @override
  String toString() {
    return "$codigo $nombres $apellidos $correo";
  }
}
