import 'dart:math';

main(List<String> args) {
  String expresion = "(a+[(b*5-[(a(7)+(35*5))])])";
  print(estaBalanceado(expresion));
}

bool estaBalanceado(String expresion) {
  Pila<String> p = new Pila();
  for (int i = 0; i < expresion.length; i++) {
    if (expresion[i] == "(") p.Push("(");
    if (expresion[i] == ")") {
      if (p.Pop() != "(") return false;
    }
    if (expresion[i] == "[") p.Push("[");
    if (expresion[i] == "]") {
      if (p.Pop() != "[") return false;
    }
  }
  return p.estaVacio();
}

class Nodo<E> {
  E valor;
  Nodo<E> anterior;
  Nodo({this.valor, this.anterior});
}

class Pila<T> {
  Nodo<T> superior = null;

  void Push(T n) {
    Nodo<T> nodo = new Nodo(valor: n, anterior: superior);
    superior = nodo;
  }

  T Pop() {
    T valor = superior.valor;
    superior = superior.anterior;
    return valor;
  }

  bool estaVacio() {
    return superior == null;
  }
}

// void main(List<String> args) {
//   // Pila p = new Pila();
//   // print(p.estaVacio());
//   // p.push(15);
//   // print(p.superior.valor);
//   // p.push(10);
//   // print(p.superior.valor);
//   // print(p.pop());
//   // print(p.estaVacio());
//   // String expresion = "(a+[(b*5-[(a(7)+(35*5)]))])";
//   // print(estaBalanceado(expresion));
// }

// bool estaBalanceado(String expresion) {
//   Pila p = new Pila();
//   for (int i = 0; i < expresion.length; i++) {
//     if (expresion[i] == "(") p.push(1);
//     if (expresion[i] == ")") p.pop();
//   }
//   return p.estaVacio();
// }

// class Nodo<T> {
//   T valor;
//   Nodo<T> anterior;
//   Nodo({this.valor, this.anterior});
// }

// class Pila<T> {
//   Nodo<T> superior;

//   void push(T n) {
//     Nodo<T> nodo = Nodo(valor: n, anterior: superior);
//     superior = nodo;
//   }

//   // int pop() {
//   //   int numero = superior.anterior.valor;
//   //   return numero;
//   // }

//   T pop() {
//     T valor = superior.valor;
//     superior = superior.anterior;
//     return valor;
//   }

//   bool estaVacio() {
//     return superior == null;
//   }
// }
