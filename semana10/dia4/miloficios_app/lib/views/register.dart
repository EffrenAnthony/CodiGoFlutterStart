import 'package:flutter/material.dart';
import 'package:miloficios_app/main.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/utils/sesion_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerDni = TextEditingController();
  String error = '';
  bool inAsyncCall = false;

  void registrarUsuario() async {
    setState(() {
      inAsyncCall = true;
    });
    bool exito = await HttpHelper().registrarUsuario(
        controllerUsuario.text,
        controllerPassword.text,
        controllerCorreo.text,
        controllerNombre.text,
        controllerApellido.text,
        controllerDni.text);
    if (exito) {
      String token = await HttpHelper()
          .iniciarSesion(controllerUsuario.text, controllerPassword.text);
      if (token.length > 0) {
        Navigator.pop(context);
        Provider.of<UserProvider>(context, listen: false).saveUserData(token);
      } else {
        setState(() {
          error = 'Credenciales incorretas';
        });
      }
    }
    setState(() {
      inAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.vexels.com/media/users/3/148169/isolated/preview/dc80daf8be6e9366128d6a182c225373-fundo-quadrado-roxo-abstrato-by-vexels.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Mil Oficios',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerUsuario,
                            decoration: InputDecoration(
                              hintText: 'Usuario',
                              prefixIcon: Icon(Icons.account_circle),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              prefixIcon: Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerCorreo,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.mail),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerNombre,
                            decoration: InputDecoration(
                              hintText: 'Nombres',
                              prefixIcon: Icon(Icons.account_box),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerApellido,
                            decoration: InputDecoration(
                              hintText: 'Apellidos',
                              prefixIcon: Icon(Icons.account_box),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerDni,
                            decoration: InputDecoration(
                              hintText: 'DNI',
                              prefixIcon: Icon(Icons.person_pin_circle),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RaisedButton(
                            color: Colors.blueGrey.shade700,
                            onPressed: () {
                              registrarUsuario();
                            },
                            child: Text(
                              'Registrarme',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
