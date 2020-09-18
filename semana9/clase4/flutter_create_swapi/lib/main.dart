import 'package:flutter/material.dart';
import 'package:flutter_create_swapi/movie_provider.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        )
      ], child: Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Provider.of<MovieProvider>(context).movie == null
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (value) =>
                          Provider.of<MovieProvider>(context, listen: false)
                              .fetchMovie(
                        int.parse(
                          (value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (value) =>
                          Provider.of<MovieProvider>(context, listen: false)
                              .fetchMovie(
                        int.parse(
                          (value),
                        ),
                      ),
                    ),
                    FlatButton(onPressed: () {}, child: Text('Consultar')),
                    Text(Provider.of<MovieProvider>(context).movie.title),
                    Text(
                        Provider.of<MovieProvider>(context).movie.openingCrawl),
                  ],
                ),
              ),
            ),
    );
  }
}
