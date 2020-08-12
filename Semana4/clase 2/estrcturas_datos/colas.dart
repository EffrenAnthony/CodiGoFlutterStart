main(List<String> args) {
  Cola<int> c = new Cola();
  c.push(1);
  c.push(2);
  c.push(3);
  c.push(4);
  c.pop();
}

class Nodo<E> {
  E valor;
  Nodo<E> siguiente;
  Nodo({this.valor, this.siguiente});
}

class Cola<E> {
  Nodo<E> primero;
  Nodo<E> ultimo;

  void push(E valor) {
    Nodo<E> n = Nodo(valor: valor);
    if (ultimo == null) {
      ultimo = n;
      primero = n;
    } else {
      ultimo.siguiente = n;
      ultimo = n;
    }
  }

  E pop() {
    E resultado = primero.valor;
    primero = primero.siguiente;
    return resultado;
  }
}
