import 'package:flutter/material.dart';
import 'package:flutter_pokedex/routes/pokemon_list.dart';
import 'package:flutter_pokedex/util/commons.dart';
import 'package:flutter_pokedex/util/http_helper.dart';

class PokemonTypes extends StatefulWidget {
  PokemonTypes({Key key}) : super(key: key);

  @override
  _PokemonTypesState createState() => _PokemonTypesState();
}

class _PokemonTypesState extends State<PokemonTypes> {
  HttpHelper helper;
  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Pokemon'),
      ),
      body: FutureBuilder(
          future: helper.getTypes(),
          builder: (c, snapshot) {
            if (snapshot.hasData) {
              List types = snapshot.data;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: types.length,
                  itemBuilder: (c, i) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonList(i + 1),
                              ));
                        },
                        child: Card(
                          color: colorsType[types[i]],
                          child: Center(
                            child: Text(
                              snapshot.data[i],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ));
            } else if (snapshot.hasError) {
              return Text('Error');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
