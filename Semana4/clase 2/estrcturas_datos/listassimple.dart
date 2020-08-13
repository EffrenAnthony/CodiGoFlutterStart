void main(List<String> args) {
  ListaS<int> l = new ListaS();
  l.insertarFin(15);
  l.insertarFin(16);
  l.insertarFin(17);
  l.insertarFin(18);
  l.insertarPosicion(20, 4);
  l.insertarPosicion(24, 5);
  l.insertarFin(19);
  l.insertarInicio(14);
  l.eliminarPrimero();
  l.imprimir();
}

class Nodo<T> {
  T valor;
  Nodo<T> siguiente;
  Nodo({this.valor, this.siguiente});
}

class ListaS<T> {
  Nodo<T> inicio;
  Nodo<T> fin;

  void imprimir() {
    Nodo<T> tmp = inicio;
    while (tmp != null) {
      print(tmp.valor);
      tmp = tmp.siguiente;
    }
  }

  void insertarInicio(T valor) {
    Nodo<T> n = Nodo(valor: valor, siguiente: inicio);
    inicio = n;
    if (fin == null) {
      inicio = n;
      fin = n;
    }
  }

  void eliminarPrimero() {
    inicio = inicio.siguiente;
  }

  void insertarFin(T valor) {
    Nodo<T> n = Nodo(valor: valor);
    if (fin == null) {
      fin = n;
      inicio = n;
    } else {
      fin.siguiente = n;
      fin = n;
    }
  }

  void insertarPosicion(T valor, int posicion) {
    if (posicion == 0) {
      insertarInicio(valor);
    } else {
      Nodo<T> actual = inicio;
      for (var i = 1; i < posicion && actual.siguiente != null; i++) {
        actual = actual.siguiente;
      }
      Nodo<T> n = Nodo(valor: valor, siguiente: actual.siguiente);
      actual.siguiente = n;
    }
  }
}
