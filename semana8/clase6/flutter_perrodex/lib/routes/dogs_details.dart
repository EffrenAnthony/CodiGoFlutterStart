import 'package:flutter/material.dart';
import 'package:flutter_perrodex/util/http_helper.dart';

class DogsDetails extends StatefulWidget {
  String breed;
  DogsDetails(this.breed);

  @override
  _DogsDetailsState createState() => _DogsDetailsState(breed);
}

class _DogsDetailsState extends State<DogsDetails> {
  String breed;

  _DogsDetailsState(this.breed);
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
        title: Text(breed.toUpperCase()),
      ),
      body: FutureBuilder(
        future: helper.getDogImages(breed),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List dogImages = snapshot.data;
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(dogImages[0]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Raza: ${breed.toUpperCase()}',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 0,
                      left: 10,
                    ),
                    child: Text(
                      'Galería de imagenes',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: dogImages.length - 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          dogImages[index + 1],
                          width: 110.0,
                          height: 110.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                )),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
