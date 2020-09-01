import 'package:flutter/material.dart';
import 'package:flutter_router/segundapagina.dart';

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
      home: PrimeraPagina(),
      // routes: {
      //   '/pagina2': (context) {
      //     return Scaffold(
      //       appBar: AppBar(
      //         title: Text('Pagina2'),
      //       ),
      //       body: Column(
      //         children: [
      //           TextField(),
      //           Container(
      //             height: 200,
      //             width: 300,
      //             color: Colors.greenAccent,
      //           )
      //         ],
      //       ),
      //     );
      //   }
      // },
      onGenerateRoute: (settings) {
        if (settings.name == '/pagina2') {
          return MaterialPageRoute<UserDetails>(builder: (context) {
            {
              return SegundaPagina(settings.arguments);
            }
          });
        }
      },
    );
  }
}

class UserDetails {
  String nombre;
  String apellido;

  UserDetails(this.nombre, this.apellido);
}

class PrimeraPagina extends StatefulWidget {
  const PrimeraPagina({Key key}) : super(key: key);

  @override
  _PrimeraPaginaState createState() => _PrimeraPaginaState();
}

class _PrimeraPaginaState extends State<PrimeraPagina> {
  UserDetails _userDetails = UserDetails('Anthony', 'Peña');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primnera Pagina'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nombre: ${_userDetails.nombre}'),
            Text('Apellido: ${_userDetails.apellido}'),
            RaisedButton(
              onPressed: () async {
                UserDetails resultado = await Navigator.pushNamed(
                    context, '/pagina2',
                    arguments: _userDetails
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) {
                    //     return SegundaPagina(_userDetails);
                    //   },
                    // ),
                    );
                if (resultado != null) {
                  setState(() {
                    _userDetails = resultado;
                  });
                }
                // ? Navigation con nombre la ruta está arriba en Material App
                // Navigator.pushNamed(context, '/pagina2');
                // ? Navigation builder sin nombre
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) {
                // return Scaffold(
                //   appBar: AppBar(
                //     title: Text('Pagina2'),
                //   ),
                //   body: Column(
                //     children: [
                //       TextField(),
                //       Container(
                //         height: 200,
                //         width: 300,
                //         color: Colors.greenAccent.shade700,
                //       )
                //     ],
                //   ),
                // );
                // },
                // ));
              },
              child: Text('Ir a segunda página'),
            ),
          ],
        ),
      ),
    );
  }
}
