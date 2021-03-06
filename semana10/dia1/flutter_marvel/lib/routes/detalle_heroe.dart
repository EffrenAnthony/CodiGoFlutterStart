import 'package:flutter/material.dart';
import 'package:flutter_marvel/models/super_heroe.dart';
import 'package:flutter_marvel/routes/detalle_comic.dart';

class DetalleHeroe extends StatelessWidget {
  SuperHeroe superHeroe;

  DetalleHeroe(this.superHeroe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              superHeroe.thumbnail.path + "." + superHeroe.thumbnail.extension),
          Text(
            superHeroe.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            superHeroe.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Aprearences:",
            style: Theme.of(context).textTheme.headline4,
          ),
          Expanded(
            child: ListView(
              children: superHeroe.comics.items
                  .map((e) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalleComic(e.resourceUri),
                              ));
                        },
                        title: Text(e.name),
                      ))
                  .toList(),
            ),
          ),
          Text(
            "Events:",
            style: Theme.of(context).textTheme.headline4,
          ),
          Expanded(
            child: ListView(
              children: superHeroe.events.items
                  .map((e) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalleComic(e.resourceUri),
                              ));
                        },
                        title: Text(e.name),
                        subtitle: Text(e.resourceUri),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
