import 'package:flutter/material.dart';
import 'package:flutter_grocery_list/models/list_items.dart';
import 'package:flutter_grocery_list/models/shopping_list.dart';
import 'package:flutter_grocery_list/util/dbHelper.dart';
import 'package:flutter_grocery_list/widgets/shopping_item_dialog.dart';

class ItemsScreen extends StatefulWidget {
  final ShoppingList shoppingList;

  ItemsScreen(this.shoppingList);

  @override
  _ItemsScreenState createState() => _ItemsScreenState(shoppingList);
}

class _ItemsScreenState extends State<ItemsScreen> {
  ShoppingList shoppingList;
  _ItemsScreenState(this.shoppingList);
  ShoppingItemDialog dialog = ShoppingItemDialog();

  DbHelper helper = DbHelper();
  List<ListItem> listItems;

  Future showData() async {
    // print("muestra items");
    await helper.openDb();
    listItems = await helper.getItems(shoppingList.id);
    setState(() {
      listItems = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.name),
      ),
      body: Column(
        children: [
          // RaisedButton(
          //   child: Text('Agregar Item'),
          //   onPressed: () async {
          //     await helper.insertItem(ListItem(
          //         0, shoppingList.id, "Item Agreado Boton", "10kg", "obs"));
          //     showData();
          //   },
          // ),
          Expanded(
            child: ListView.builder(
                itemCount: listItems != null ? listItems.length : 0,
                itemBuilder: (c, i) {
                  return Dismissible(
                    key: Key(listItems[i].name),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) {
                      String name = listItems[i].name;
                      helper.deleteItem(listItems[i]);
                      setState(() {
                        listItems.removeAt(i);
                      });
                      // Es como si estuvieramos llamando al metodo de su padre
                      Scaffold.of(c).showSnackBar(
                          SnackBar(content: Text('Eliminado: $name')));
                    },
                    child: ListTile(
                      title: Text(listItems[i].name),
                      subtitle: Text(
                          listItems[i].quantity + " - " + listItems[i].note),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => dialog.buildDialog(
                                  context, listItems[i], false));
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => dialog.buildDialog(
                  context, ListItem(0, shoppingList.id, "", "", ""), true));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
