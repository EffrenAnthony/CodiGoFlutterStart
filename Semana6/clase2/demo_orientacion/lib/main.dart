import 'package:flutter/material.dart';

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
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation or = MediaQuery.of(context).orientation;
    print(or);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Demo Orientacon'),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              title: Text('Pagina 1'),
            ),
            ListTile(
              title: Text('Pagina 2'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Demo Orientacon'),
      ),
      body: Container(
        child: Column(
          children: [
            or == Orientation.landscape
                ? Row(
                    children: [
                      Icon(Icons.ac_unit),
                      Icon(Icons.ac_unit),
                    ],
                  )
                : Icon(Icons.ac_unit),
            Container(
              width: or == Orientation.landscape ? 200 : 100,
              height: 100,
              color: Colors.redAccent,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: or == Orientation.landscape ? 10 : 3),
                itemBuilder: (context, index) {
                  return Text('data');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
