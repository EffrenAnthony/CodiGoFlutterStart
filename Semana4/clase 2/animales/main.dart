void main(List<String> args) {}

abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

abstract class Nadador {
  void nadar() {}
}

abstract class Volador {
  void volar() {}
}

abstract class Caminador {
  void caminar() {}
}

// mixin -> agregar with para agregar una clase mas extendida que perminta heredar
class Delfin extends Mamifero with Nadador {
  @override
  void nadar() {}
}

class Murcielago extends Mamifero with Volador, Caminador {
  @override
  void volar() {}
  @override
  void caminar() {}
}

class Gato extends Mamifero {}

class Paloma extends Ave with Volador, Caminador {
  @override
  void volar() {}
  @override
  void caminar() {}
}

class Pato extends Ave with Volador, Nadador, Caminador {
  @override
  void volar() {}
  @override
  void caminar() {}
  @override
  void nadar() {}
}

class Tiburon extends Pez with Nadador {
  @override
  void nadar() {}
}

class PezVolador extends Pez with Nadador, Volador {
  @override
  void nadar() {}
  @override
  void volar() {}
}
