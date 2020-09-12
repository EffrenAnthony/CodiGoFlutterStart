import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/util/http_helper.dart';

import '../main.dart';

class PokemonDetail extends StatefulWidget {
  int id;
  PokemonDetail(this.id);

  @override
  _PokemonDetailState createState() => _PokemonDetailState(id);
}

class _PokemonDetailState extends State<PokemonDetail> {
  int id;
  HttpHelper helper;
  String imageUrl = "https://pokeres.bastionbot.org/images/pokemon/";
  Map colorsType = {
    'grass': Colors.greenAccent,
    'poison': Colors.deepPurple,
    'fire': Colors.redAccent,
    'flying': Colors.blueGrey.shade300,
    'bug': Colors.green,
    'normal': Colors.grey,
    'water': Colors.blueAccent,
    'psychic': Colors.deepPurpleAccent,
    'dragon': Colors.blueGrey,
    'fight': Colors.red,
    'electric': Colors.yellow,
    'ice': Colors.lightBlue,
    'rock': Colors.brown,
    'fairy': Colors.pinkAccent,
    'sand': Colors.amber,
    'steel': Colors.blueGrey.shade700,
    'ground': Colors.brown.shade300,
    'ghost': Colors.deepPurpleAccent.shade700
  };

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  _PokemonDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Seleccionado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: id.toString(),
                child: Image.network(
                  imageUrl + id.toString() + ".png",
                  height: 250,
                ),
              ),
              FutureBuilder(
                future: helper.getPokemon(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Pokemon pokemon = snapshot.data;
                    return buildPokemonDetail(pokemon);
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPokemonDetail(Pokemon pokemon) {
    return Column(
      children: [
        Text(
          pokemon.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Peso: ${pokemon.weight}'),
            Text('Tamaño: ${pokemon.height}'),
          ],
        ),
        Container(
          height: 60,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: pokemon.types.length,
            itemBuilder: (c, i) {
              return Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorsType[pokemon.types[i].type.name]),
                child: Text(
                  pokemon.types[i].type.name,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
        Text('Sprites'),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(pokemon.sprites.frontDefault),
              Image.network(pokemon.sprites.backDefault),
              Image.network(pokemon.sprites.frontShiny),
              Image.network(pokemon.sprites.backShiny),
            ],
          ),
        ),
        Text('Movimientos'),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 8),
            itemCount: pokemon.moves.length,
            itemBuilder: (context, index) {
              return Text((index + 1).toString() +
                  ' ' +
                  pokemon.moves[index].move.name);
            },
          ),
        )
      ],
    );
  }
}
