import 'package:flutter/material.dart';
import 'package:flutter_perrodex/routes/dogs_details.dart';
import 'package:flutter_perrodex/util/http_helper.dart';

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
      home: PerroDex(),
    );
  }
}

class PerroDex extends StatefulWidget {
  PerroDex({Key key}) : super(key: key);

  @override
  _PerroDexState createState() => _PerroDexState();
}

class _PerroDexState extends State<PerroDex> {
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
        title: Text('Perrodex'),
      ),
      body: FutureBuilder(
        future: helper.getDogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data.toString());
            List dogNames = snapshot.data;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: dogNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DogsDetails(snapshot.data[index]),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  dogNames[index].toString().toUpperCase()),
                            ),
                            FutureBuilder(
                              future: helper.getDogImage(dogNames[index]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    height: 125,
                                    width: 125,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snapshot.data),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return (snapshot.error);
                                }
                                return CircularProgressIndicator();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // print(snapshot.data.toString());
            return Text(snapshot.error.toString());
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          initState();
        });
      }),
    );
  }
}
