import 'package:flutter_grocery_list/models/shopping_list.dart';
import 'package:flutter_grocery_list/models/list_items.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  int version = 1;
  Database db;
  // static final hace que la variable sea estatica e inmutable
  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  // nos permite que cada vez que llamemos al constructor no crea uno nuevo, sino retorna el constructor que se creo la primera vez

  factory DbHelper() {
    return _dbHelper;
  }

  // Retornamos un future porque no sabemos cuando va a retornar la info de la base de datos
  // Ek future es un tipo de dato que nos va a dar información pero no sabemos cuadno
  Future<Database> openDb() async {
    //await deleteDatabase(join(await getDatabasesPath(), 'shopping.db'));
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
        database.execute(
            'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT, FOREIGN KEY(idList) REFERENCES lists(id))');
      }, version: version);
    }
    return db;
  }

  Future testDb() async {
    db = await openDb();
    await db.execute('INSERT INTO lists VALUES (0, "Fruta", 2)');
    await db.execute(
        'INSERT INTO items VALUES (0, 0, "Manzanas", "10 Kg", "Rojas")');
    List lists = await db.rawQuery("select * from lists");
    List items = await db.rawQuery("select * from items");
    print(lists[0].toString());
    print(items[0].toString());
  }

  Future<int> insertList(ShoppingList list) async {
    int id = await db.insert("lists", list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> insertItem(ListItem list) async {
    int id = await db.insert("items", list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<ShoppingList>> getLists() async {
    // db.query nos retorna todos los mapas que hemos obtenido en la lista
    List<Map<String, dynamic>> maps = await db.query('lists');
    return List.generate(
      maps.length,
      (i) => ShoppingList(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['priority'],
      ),
    );
  }

  Future<List<ListItem>> getItems(int idList) async {
    List<Map<String, dynamic>> maps =
        await db.query('items', where: 'idList = ?', whereArgs: [idList]);
    return List.generate(
      maps.length,
      (i) => ListItem(
        maps[i]['id'],
        maps[i]['idList'],
        maps[i]['name'],
        maps[i]['quantity'],
        maps[i]['note'],
      ),
    );
  }

  Future<int> deleteList(ShoppingList list) async {
    int resultItems =
        await db.delete('items', where: "idList = ?", whereArgs: [list.id]);
    int result =
        await db.delete('lists', where: "id = ?", whereArgs: [list.id]);
    return result;
  }

  Future<int> deleteItem(ListItem item) async {
    int resultItems =
        await db.delete('items', where: "id = ?", whereArgs: [item.id]);
    print(item.id);
    return resultItems;
  }
}
