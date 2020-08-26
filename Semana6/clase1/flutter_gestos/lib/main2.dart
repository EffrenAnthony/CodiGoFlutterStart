import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DemoInputs(),
    );
  }
}

class DemoInputs extends StatefulWidget {
  @override
  _DemoInputsState createState() => _DemoInputsState();
}

class _DemoInputsState extends State<DemoInputs> {
  // este controlador, se encarga de controlar el estado del textflied
  // Un listener es un evento que se llama cada vez que se modifica el controlador
  String valorTexto = '';
  // String textoInvertido = '';

  TextEditingController _controller = TextEditingController(text: '');

  void cambioValorTexto() {
    print(_controller.text);
    setState(() {
      valorTexto = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(cambioValorTexto);
    print('creando widget');
  }

// Dispose sirve para cuando se elimine un elemento o widgtet
  @override
  void dispose() {
    _controller.addListener(cambioValorTexto);
    print('Murio widget');
    super.dispose();
  }

// solo debe estar dentro del build lo que se llama 1 vez, al mmomento de crear ek widget, los metodos como listener
// deben estar antes para unicamente llamarse cuando se necesitan y no volver a renderizar de nuevo el widget
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                inputFormatters: [
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) {
                      return newValue.copyWith(
                        text: newValue.text.toUpperCase(),
                      );
                    },
                  )
                ],
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.accessibility_new),
                  labelText: 'Ingrese Texto',
                  hintText: 'Ingrese su texto a invertir',
                  helperText: 'Esta es la ayuda',
                  counterText: '100',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                keyboardType: TextInputType.datetime,
                // cuando cambia de valor
                onChanged: (value) {
                  print('cambio $value');
                },
                // cuando se termina de llenar y se da aceptar o check al teclado
                onEditingComplete: () {
                  print('Termino de editarse');
                },
                // cuando se envía
                onSubmitted: (value) => print('envió $value'),
                controller: _controller,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('prueba'),
            )
          ],
        ),
        Text(valorTexto.split('').reversed.join())
      ],
    ));
  }
}
