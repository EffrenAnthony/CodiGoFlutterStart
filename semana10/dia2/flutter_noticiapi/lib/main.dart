import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_noticiapi/models/noticia.dart';
import 'package:flutter_noticiapi/routes/diarios.dart';
import 'package:flutter_noticiapi/utils/http_helper.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: MyHomePage(title: 'CodiGoNoticias'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateFormat fomatoFecha = DateFormat("dd/MM/yy");
  DateTime fechaSeleccionada = DateTime.now();
  TextEditingController controller = TextEditingController(text: 'Peru');
  String textoBusqueda = 'Peru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  setState(() {
                    textoBusqueda = value;
                  });
                },
              )),
              FlatButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 1, 1),
                        maxTime: DateTime.now(), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        fechaSeleccionada = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                  },
                  child: Text(
                    fomatoFecha.format(fechaSeleccionada),
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future:
                  HttpHelper().fetchNoticias(fechaSeleccionada, textoBusqueda),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Noticia> noticias = snapshot.data;
                  if (noticias.length == 0)
                    return Center(child: Text("Este dia no hay noticias"));

                  return ListView.builder(
                    itemCount: noticias.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () async {
                        if (await canLaunch(noticias[index].url)) {
                          await launch(noticias[index].url);
                        }
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Image.network(
                              noticias[index].urlToImage.toString(),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      noticias[index].title.toString(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      noticias[index].source.name.toString() +
                                          " - " +
                                          fomatoFecha
                                              .format(
                                                  noticias[index].publishedAt)
                                              .toString(),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      noticias[index].description.toString(),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(noticias[index].author.toString(),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaDeDiarios(),
            ));
      }),
    );
  }
}
