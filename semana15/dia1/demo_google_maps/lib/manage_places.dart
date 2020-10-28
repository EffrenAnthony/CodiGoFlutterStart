import 'package:demo_google_maps/dbHelper.dart';
import 'package:demo_google_maps/place.dart';
import 'package:demo_google_maps/place_dialog.dart';
import 'package:flutter/material.dart';

class ManagePlaces extends StatefulWidget {
  ManagePlaces({Key key}) : super(key: key);

  @override
  _ManagePlacesState createState() => _ManagePlacesState();
}

class _ManagePlacesState extends State<ManagePlaces> {
  List<Place> places = [];
  DbHelper dbHelper = DbHelper();
  Future _getData() async {
    await dbHelper.openDb();
    places = await dbHelper.getPlaces();
    setState(() {
      places = places;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => Dismissible(
          secondaryBackground: Container(
            child: Icon(
              Icons.delete_outlined,
              color: Colors.white,
            ),
            color: Colors.redAccent,
          ),
          background: Container(
            child: Icon(
              Icons.delete_forever_outlined,
              color: Colors.white,
            ),
            color: Colors.greenAccent,
          ),
          onDismissed: (direction) {
            dbHelper.deletePlace(places[index]);
            setState(() {
              places.removeAt(index);
            });
          },
          key: Key(places[index].id.toString()),
          child: ListTile(
            title: Text(places[index].name),
            trailing: IconButton(
              icon: Icon(Icons.edit_location_outlined),
              onPressed: () async {
                PlaceDialog dialog = PlaceDialog(places[index], false);
                await showDialog(
                  context: context,
                  builder: (context) => dialog.buildAlert(context),
                );
                _getData();
              },
            ),
          ),
        ),
      ),
    );
  }
}
