import 'package:flutter/material.dart';
import 'package:flutter_hero_animation/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  List<String> rutas = ['/', '/birthday', '/calendar', '/alarm'];

  @override
  void initState() {
    super.initState();
    _listPages.add(Home());
    _listPages.add(Birthday());
    _listPages.add(Calendar());
    _listPages.add(Alarm());
    _currentIndex = 0;
    _currentPage = _listPages[0];
  }

  void cambiarPagina(int i) {
    setState(() {
      _currentIndex = i;
      _currentPage = _listPages[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppHero'),
      ),
      endDrawer: Drawer(
        elevation: 10,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'BP Wallet',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            ListTile(
              title: Text('Ir Pag2'),
              leading: Icon(Icons.access_time),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ));
              },
            )
          ],
        ),
      ),
      body: Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (context) => Home();
              break;
            case '/birthday':
              builder = (context) => Birthday();
              break;
            case '/calendar':
              builder = (context) => Calendar();
              break;
            case '/alarm':
              builder = (context) => Alarm();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.blueAccent,
              onPressed: () {
                navigatorKey.currentState.pushNamed(rutas[0]);
              },
            ),
            IconButton(
              icon: Icon(Icons.cake),
              color: Colors.blueAccent,
              onPressed: () {
                navigatorKey.currentState.pushNamed(rutas[1]);
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: Colors.blueAccent,
              onPressed: () {
                navigatorKey.currentState.pushNamed(rutas[2]);
              },
            ),
            IconButton(
              icon: Icon(Icons.alarm),
              color: Colors.blueAccent,
              onPressed: () {
                navigatorKey.currentState.pushNamed(rutas[3]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       title: Text('Home'),
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Text('Cumpleaños'),
      //       icon: Icon(Icons.cake),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Text('Calendario'),
      //       icon: Icon(Icons.calendar_today),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Text('Alarma'),
      //       icon: Icon(Icons.alarm),
      //     ),
      //   ],
      //   // onTap: (index) => cambiarPagina(index),
      //   onTap: (index) {
      //     navigatorKey.currentState.pushNamed(rutas[index]);
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Page2();
          },
        ));
      },
      child: Hero(
        tag: 'etiquetaIcono',
        child: Icon(
          Icons.home,
          color: Colors.deepPurpleAccent,
          size: 40,
        ),
      ),
    );
  }
}

class Birthday extends StatelessWidget {
  const Birthday({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.cake),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.calendar_today),
    );
  }
}

class Alarm extends StatelessWidget {
  const Alarm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.alarm),
    );
  }
}
