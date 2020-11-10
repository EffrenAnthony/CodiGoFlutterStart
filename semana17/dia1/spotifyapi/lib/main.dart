import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotifyapi/artist_detail.dart';
import 'package:spotifyapi/models/artist.dart';

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
      home: SearchArtistView(),
    );
  }
}

class SearchArtistView extends StatefulWidget {
  @override
  _SearchArtistViewState createState() => _SearchArtistViewState();
}

class _SearchArtistViewState extends State<SearchArtistView> {
  TextEditingController searchController = TextEditingController();
  List artistas = [];

  String token =
      "Bearer BQDBtuuOAaiZvUiRA2-N_vV_ZMOVUNOdNRtcOTPRMz9iXR7NIb8fOUJrPb93DzFrIYKbIS_xEtPymuAr3W5IDUzNOQKtHa7qoYEiSqz6NLeusatczLyXBljLAdvACqGjjfzND4rYMDBmFYSciHr7HMu90eYPNe6g58bqSwZex2s3dZWZsyxv55jFkDKtfLMz-qd8gjg9EwhUdyjiEd3CYtHJIV991Q6tD2B4XvO8X10C4AqmtMAwxYDesZmiA3QmGm0O5GiLaffUOmtOvTXb";

  void getArtists() async {
    Response response = await Dio().get(
      "https://api.spotify.com/v1/search?q=${searchController.text}&type=artist",
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    var jsonArtists = response.data["artists"]["items"];
    artistas = jsonArtists.map((e) => Artist.fromJson(e)).toList();
    // for (var a in jsonArtists) {
    //   var artista = Artist.fromJson(a);
    //   artistas.add(artista);
    //   print(artista.name);
    // }
    setState(() {
      artistas = artistas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpotofiAPI"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(hintText: "Artista"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      getArtists();
                    })
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemCount: artistas.length,
              itemBuilder: (context, index) => ListTile(
                leading: artistas[index].images.length > 0
                    ? Image.network(artistas[index].images[0].url)
                    : Container(),
                title: Text(artistas[index].name),
                trailing: Text(artistas[index].popularity.toString()),
                subtitle: Text(artistas[index].genres.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistDetail(artistas[index].id),
                      ));
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
