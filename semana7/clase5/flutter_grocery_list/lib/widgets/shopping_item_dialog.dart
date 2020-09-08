import 'package:flutter/material.dart';
import 'package:flutter_grocery_list/models/list_items.dart';
import 'package:flutter_grocery_list/models/shopping_list.dart';
import 'package:flutter_grocery_list/util/dbHelper.dart';

class ShoppingItemDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtQuantity = TextEditingController();
  TextEditingController txtNote = TextEditingController();

  Widget buildDialog(BuildContext context, ListItem item, bool isNew) {
    if (!isNew) {
      txtName.text = item.name;
      txtQuantity.text = item.quantity;
      txtNote.text = item.note;
    } else {
      txtName.text = "";
      txtQuantity.text = "";
      txtNote.text = "";
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(isNew ? "Nuevo Item" : "Editar Item"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(hintText: "Nombre del Item"),
            ),
            TextField(
              controller: txtQuantity,
              decoration: InputDecoration(hintText: "Cantidad"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: txtNote,
              decoration: InputDecoration(hintText: "Nota"),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text("Guardar Item"),
              onPressed: () async {
                item.name = txtName.text;
                item.quantity = txtQuantity.text;
                item.note = txtNote.text;
                DbHelper helper = DbHelper();
                await helper.openDb();
                await helper.insertItem(item);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
