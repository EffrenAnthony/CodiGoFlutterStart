import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaCompras(),
    );
  }
}

class ListaCompras extends StatefulWidget {
  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  // Permite asignar claves a elementos, para referenciar por ejemplo a un formulario
  GlobalKey<FormState> _formKey = GlobalKey();
  List<ItemLista> items = [];
  String item = '';
  int cantidad = 0;
  String _validarItemVacio(String value) =>
      value.isEmpty ? 'Campo requerido' : null;

  String _validarMayorQueCero(String value) {
    int valor = value.isEmpty ? 0 : int.parse(value);
    return valor == 0 ? 'Se requiere al menos 1 unidad' : null;
  }

  String _verificarYAgregarOrden() {
    // validate va a llamar a los validator de cada uno de los elementos
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      ItemLista i = ItemLista(item: item, cantidad: cantidad);
      setState(() {
        items.insert(0, i);
      });
      _formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: _validarItemVacio,
                  decoration: InputDecoration(labelText: 'Item'),
                  onSaved: (newValue) => item = newValue,
                ),
                TextFormField(
                  validator: _validarMayorQueCero,
                  decoration: InputDecoration(labelText: 'Cantidad'),
                  onSaved: (newValue) => cantidad = int.parse(newValue),
                ),
                RaisedButton(
                  onPressed: _verificarYAgregarOrden,
                  child: Text('Submit'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Colors.redAccent,
                  ),
                  key: Key(items[index].item),
                  onDismissed: (dir) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(items[index].item),
                    subtitle: Text(items[index].cantidad.toString()),
                  ),
                );
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Expanded(
                //         child: ListTile(
                //           title: Text(items[index].item),
                //           subtitle: Text(items[index].cantidad.toString()),
                //         ),
                //       ),
                //       IconButton(
                //           iconSize: 2,
                //           icon: Icon(Icons.remove),
                //           color: Colors.blueAccent,
                //           onPressed: () {
                //             setState(() {
                //               items.removeAt(index);
                //             });
                //           })
                //     ],
                //   ),
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemLista {
  String item;
  int cantidad;
  ItemLista({this.item, this.cantidad});
}
