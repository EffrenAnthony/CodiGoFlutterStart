class Alumno {
  int codigo;
  String nombres;
  String apellidos;
  String genero;
  double notaFinal;

  Alumno(
      {this.codigo, this.nombres, this.apellidos, this.genero, this.notaFinal});

  // Contructor con nombre
  Alumno.SoloNombre(int codigo, String nombres) {
    this.codigo = codigo;
    this.nombres = nombres;
    this.apellidos = apellidos;
  }

  AlumnoCointructorNormal(int codigo, String nombres, String apellidos) {
    this.codigo = codigo;
    this.nombres = nombres;
    this.apellidos = apellidos;
  }

  // permite imorimir los atributos de la clase
  String toString() {
    return '${codigo}.- ${genero} ${apellidos}, ${nombres} : ${notaFinal}';
  }

  void imprimir() {
    print('${codigo}.- ${apellidos}, ${nombres}');
  }
}
