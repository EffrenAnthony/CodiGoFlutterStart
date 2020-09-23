import 'package:flutter/material.dart';
import 'package:flutter_noticiapi/models/noticiero.dart';
import 'package:flutter_noticiapi/utils/http_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaDeDiarios extends StatefulWidget {
  ListaDeDiarios({Key key}) : super(key: key);

  @override
  _ListaDeDiariosState createState() => _ListaDeDiariosState();
}

class _ListaDeDiariosState extends State<ListaDeDiarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticieros'),
      ),
      body: FutureBuilder(
        future: HttpHelper().fetchNoticieros(),
        builder: (context, snapshot) {
          List<Noticiero> noticieros = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: noticieros.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          noticieros[index].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            noticieros[index].description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Categoria: ${noticieros[index].category}'),
                            Text('Pais: ${noticieros[index].country}'),
                            Text('Idioma: ${noticieros[index].language}')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RaisedButton(
                            child: Text(
                              'View Website',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            onPressed: () async {
                              if (await canLaunch(noticieros[index].url)) {
                                await launch(noticieros[index].url);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
