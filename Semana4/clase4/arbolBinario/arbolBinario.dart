import 'dart:io';

import 'persona.dart';

void main(List<String> args) {
  Arbol<Persona> arbol = new Arbol();
  arbol.Insertar(Persona(id: 15, nombre: "Tony"));
  arbol.Insertar(Persona(id: 10, nombre: "Bel"));
  arbol.Insertar(Persona(id: 18, nombre: "Lufa"));
  arbol.Insertar(Persona(id: 7, nombre: "Lili"));
  arbol.Insertar(Persona(id: 9, nombre: "Flavio"));
  arbol.Insertar(Persona(id: 11, nombre: "Jeampi"));
  arbol.Insertar(Persona(id: 5, nombre: "Titi"));
  arbol.Insertar(Persona(id: 14, nombre: "Pedro"));
  print(arbol.buscarAlumno(Persona(id: 150)));
  arbol.Imprimir();
}

class Arbol<T> {
  Vertice<T> inicio;
  T buscarAlumno(T valorBuscar) {
    return inicio.buscarObjeto(valorBuscar);
  }

  void Insertar(T valor) {
    Vertice<T> nuevo = new Vertice<T>(valor: valor);
    if (inicio == null) {
      inicio = nuevo;
    } else {
      inicio.agregarVertice(valor);
      // Vertice<T> actual = inicio;
      // dynamic actualvalor = inicio.valor;
      // dynamic nuevovalor = valor;
      // while(){
      //   if(actualvalor > nuevovalor){
      //     actual = actualvalor;
      //     actualvalor = actual.menor.valor;
      //   }else{
      //     actual = actual.mayor;
      //     actualvalor = actual.mayor.valor;
      //   }
      // }
      // if (actualvalor > nuevovalor) {
      //   inicio.menor = nuevo;
      // } else {
      //   inicio.mayor = nuevo;
      // }
    }
  }

  void Imprimir() {
    File file = new File('grafo');
    String str = "graph {";
    str += inicio.imprimir(inicio.valor);
    str += "}";
    file.writeAsString(str);
  }
}

class Vertice<T> {
  T valor;
  Vertice<T> menor;
  Vertice<T> mayor;

  Vertice({this.valor, this.menor, this.mayor});

  T buscarObjeto(T valorBuscado) {
    if (valor == valorBuscado) return valor;
    dynamic actualvalor = valor;
    dynamic buscarvalor = valorBuscado;
    if (actualvalor > buscarvalor) {
      if (menor == null) {
        return null;
      }
      return menor.buscarObjeto(valorBuscado);
    } else {
      if (mayor == null) {
        return null;
      }
      return mayor.buscarObjeto(valorBuscado);
    }
  }

  void agregarVertice(T valorNuevo) {
    dynamic actualvalor = valor;
    dynamic nuevovalor = valorNuevo;
    if (actualvalor > nuevovalor) {
      if (menor == null) {
        menor = new Vertice<T>(valor: nuevovalor);
      } else {
        menor.agregarVertice(valorNuevo);
      }
    } else {
      if (mayor == null) {
        mayor = new Vertice<T>(valor: nuevovalor);
      } else {
        mayor.agregarVertice(valorNuevo);
      }
    }
  }

  String imprimir(T v) {
    String str = "";
    str += '${v} -- ${valor};\n';
    if (menor != null) {
      str += menor.imprimir(valor);
    }
    if (mayor != null) {
      str += mayor.imprimir(valor);
    }
    return str;
  }
}
