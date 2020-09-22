import 'package:flutter/material.dart';
import 'package:flutter_marvel/models/comic.dart';
import 'package:flutter_marvel/utils/http_heleper.dart';

class DetalleComic extends StatelessWidget {
  String url;

  DetalleComic(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HttpHelper().obtenerComic(url),
        builder: (context, snapshot) {
          Comic comic = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: comic.images
                        .map((e) => Container(
                            child: Image.network(e.path + "." + e.extension)))
                        .toList(),
                  ),
                ),
                Text(
                  comic.title == null ? "" : comic.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  comic.description == null ? "" : comic.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
