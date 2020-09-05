import 'package:flutter/material.dart';
import 'package:flutter_grocery_list/models/shopping_list.dart';
import 'package:flutter_grocery_list/routes/items_screen.dart';
import 'package:flutter_grocery_list/util/dbHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GroceryList(),
    );
  }
}

class GroceryList extends StatelessWidget {
  const GroceryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DbHelper helper = DbHelper();
    // helper.testDb();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras'),
      ),
      body: ShList(),
    );
  }
}

class ShList extends StatefulWidget {
  ShList({Key key}) : super(key: key);

  @override
  _ShListState createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  DbHelper helper = DbHelper();
  List<ShoppingList> shoppingList;
  // nos permite consultar a la base de datos y pintar
  Future showData() async {
    await helper.openDb();
    shoppingList = await helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Column(
      children: [
        RaisedButton(onPressed: () async {
          await helper.insertList(ShoppingList(0, 'Lista Agregada Sape', 1));
          showData();
        }),
        Expanded(
          child: ListView.builder(
            itemCount: shoppingList != null ? shoppingList.length : 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  shoppingList[index].name,
                ),
                leading: CircleAvatar(
                  child: Text(
                    shoppingList[index].priority.toString(),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (c) {
                        return ItemsScreen(shoppingList[index]);
                      },
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
